<?php

namespace App\Http\Livewire;
use Exception;

use App\Models\Transaksi;
use App\Models\Detiltransaksi;
use App\Models\Produk;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Livewire\Component;


class Transaksis extends Component
{
    public $total;
    public $id_transaksi;
    public $id_produk;
    public $qty=1;
    public $uang;
    public $kembali;

    public function render()
    {
        $transaksi=Transaksi::select('*')->where('id_user','=',Auth::user()->id)->orderBy('id','desc')->first();

        $this->total=$transaksi->total;
        $this->kembali=$this->uang-$this->total;
        return view('livewire.transaksis')
        ->with("data",$transaksi)
        ->with("dataProduk",Produk::where('stok','>','0')->get())
        ->with("dataDetiltransaksi",Detiltransaksi::where('id_transaksi','=',$transaksi->id)->get());
    }

    public function store()
    {
        $this->validate([
            'id_produk'=>'required'
        ]);
        $transaksi=Transaksi::select('*')->where('id_user','=',Auth::user()->id)->orderBy('id','desc')->first();
        $this->id_transaksi=$transaksi->id;
        $produk=Produk::where('id','=',$this->id_produk)->get();
        $harga=$produk[0]->harga;
        Detiltransaksi::create([
            'id_transaksi'=>$this->id_transaksi,
            'id_produk'=>$this->id_produk,
            'qty'=>$this->qty,
            'harga'=>$harga
        ]);

        $total=$transaksi->total;
        $total=$total+($harga*$this->qty);
        Transaksi::where('id','=',$this->id_transaksi)->update([
            'total'=>$total
        ]);
        $this->id_produk=NULL;
        $this->qty=1;
    }

    public function delete($id_detiltransaksi)
    {
        $detiltransaksi=Detiltransaksi::find($id_detiltransaksi);
        $detiltransaksi->delete();

        //update total
        $detiltransaksi=Detiltransaksi::select('*')->where('id_transaksi','=',$this->id_transaksi)->get();
        $total=0;
        foreach($detiltransaksi as $od){
            $total+=$od->qty*$od->harga;
        }

        try{
            Transaksi::where('id','=',$this->id_transaksi)->update([
                'total'=>$total
            ]);
        }catch(Exception $e){
            dd($e);
        }
    }

    public function receipt($id)
    {
        //update stok
        $detiltransaksi=Detiltransaksi::select('*')->where('id_transaksi','=',$id)->get();
        //dd($order_detail);
        foreach ($detiltransaksi as $od) {
            $stoklama=Produk::select('stok')->where('id','=',$od->id_produk)->sum('stok');
            $stok=$stoklama-$od->qty;
            try {
                Produk::where('id','=',$od->id_produk)->update([
                    'stok'=>$stok
                ]);
            }catch (Exception $e) {
                dd($e);
            }
        }
        return Redirect::route('cetakReceipt')->with(['id'=>$id]);
    }
}
