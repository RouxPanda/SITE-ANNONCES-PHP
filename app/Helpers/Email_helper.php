<?php 

function sendMail($to, $subject, $msg) {
    try{
        $headers[] = 'MIME-Version: 1.0';
        $headers[] = 'Content-type: text/html; charset=iso-8859-1';

        $subject = "LeMauvaisCoin - " . $subject;
        
        $message = '<html><body>';
        $message .= '<h2>'. $msg .'</h2>';
        $message .= '</body></html>';

        mail($to, $subject, $message, implode("\r\n", $headers));
        return (0);
    }catch(Exception $e) {
       return (-1);
    }
}
