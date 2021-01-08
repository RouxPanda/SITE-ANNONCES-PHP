<?php 

function sendMail($to, $subject, $message) {
    try{
        $headers[] = 'MIME-Version: 1.0';
        $headers[] = 'Content-type: text/html; charset=iso-8859-1';
        mail($to, $subject, $message, $headers);
        return (0);
    }catch(Exception $e) {
       return (-1);
    }
}
