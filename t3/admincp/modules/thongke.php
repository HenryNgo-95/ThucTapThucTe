<?php
    use Carbon\Carbon;
    use Carbon\CarbonInterval;
    include('../config/config.php');
    require ('../../carbon/autoload.php');
    
    if(isset($_POST['thoigian'])){
        $thoigian = $_POST['$thoigian'];
    }else{
        $thoigian ='';
        $subdays = Carbon::now('Asia/Ho_Chi_Minh')->subdays(365)->toDateString();
    }

    if($thoigian == '7ngay'){
        $subdays = Carbon::now('Asia/Ho_Chi_Minh')->subdays(7)->toDateString();
    }elseif($thoigian =='30ngay'){
        $subdays = Carbon::now('Asia/Ho_Chi_Minh')->subdays(30)->toDateString();
    }elseif($thoigian =='180ngay'){
        $subdays = Carbon::now('Asia/Ho_Chi_Minh')->subdays(180)->toDateString();
    }elseif($thoigian =='365ngay'){
        $subdays = Carbon::now('Asia/Ho_Chi_Minh')->subdays(365)->toDateString();
    }

    $now = Carbon::now('Asia/Ho_Chi_Minh')->toDateString();

    $sql = "SELECT * FROM thongke WHERE ngaydang BETWEEN '$subdays' AND '$now' ORDER BY ngaydang ASC" ;
    $sql_query = mysqli_query($mysqli, $sql);

    while($val = mysqli_fetch_array($sql_query)){
        $chart_data[] = array(
            'date' => $val['ngaydang'],
            'value' => $val['tongsonha'],
            'orther' => $val['tongsonguoithue'],
            'quatity' => $val['tongdoanhthu']
           
        );
    }
    echo $data = json_encode($chart_data);

    
?>