<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PelangganController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\CetakController;


Route::get('/', function () {
    return view('dashboard',[
    "title"=>"Dashboard"
    ]);
})->middleware('auth');

Route::get('login',[LoginController::class,'loginView'])->name('login');
Route::post('login',[LoginController::class,'authenticate']);
Route::post('/logout',[LoginController::class, 'logout'])->name('auth.logout');


Route::resource('pengguna',UserController::class)->except('destroy','create','show','update','edit')->middleware('auth');
Route::resource('produk',ProdukController::class)->middleware('auth');
// Route::resource('kategori',CategoryController::class)->except('show','destroy','create');
Route::resource('pelanggan',PelangganController::class)->except('destroy')->middleware('auth');

Route::get('penjualan',function(){
    return view('penjualan.index',[
        "title"=>"Penjualan"
    ]);
})->name('penjualan')->middleware('auth');

Route::get('transaksi',function(){
    return view('penjualan.transaksis',[
        "title"=>"Transaksi"
    ]);
})->middleware('auth');

Route::get('cetakReceipt',[CetakController::class,'receipt'])->name('cetakReceipt')->middleware('auth');