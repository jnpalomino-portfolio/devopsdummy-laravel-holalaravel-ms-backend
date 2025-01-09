<?php

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Route;

Route::get('/mensaje', function () {
    return new JsonResponse([
        'mensaje' => '¡Hola desde mi primera API en Laravel!',
        'status' => 'success'
    ], 200);
});
