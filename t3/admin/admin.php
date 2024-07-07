<!-- Admin Lte2 github; -->


Route::group(['prefix' => ''], function(){
    Route::get('/', function(){
    return view('welcome');
    });
});

Route::group(['prefix' => 'admin'], function(){

});