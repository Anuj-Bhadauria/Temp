public class BackupMarketingCloud {

    /*Email Templates Code */

    /*
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>%%=v(@Subjectline)=%%</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 " />
    <meta name="format-detection" content="telephone=no">
    %%[
    
    VAR @BU
    VAR @From_name
    VAR @Subjectline
    VAR @Preview_Text
    VAR @Header_0
    VAR @Header_1
    VAR @Logo_url
    VAR @Inspire_copy
    VAR @Discover_copy
    VAR @Connect_copy
    VAR @Inspire_url
    VAR @Discover_url
    VAR @Connect_url
    VAR @Hero_url
    VAR @Salutation_copy_1
    VAR @Body_1
    VAR @Singular_item
    VAR @Plural_items
    VAR @In_your_bag
    VAR @Currency
    VAR @Quantity
    VAR @Subtotal
    VAR @Total
    VAR @CTA_copy
    VAR @Block_title_1
    VAR @Block_title_2
    VAR @Block_title_url
    VAR @Block_copy
    VAR @Block_sub_copy_1
    VAR @Block_sub_copy_2
    VAR @Block_sub_url
    VAR @Phone_number
    VAR @Postal_address
    VAR @Instagram_link
    VAR @Facebook_link
    VAR @Twitter_link
    VAR @Youtube_link
    VAR @Pintrest_link
    VAR @Preference_copy
    VAR @Preference_url
    VAR @Copyright
    VAR @Footer_text_1_body
    VAR @Privacy_policy_copy
    VAR @Privacy_policy_url
    VAR @Preference_centre_copy
    VAR @Preference_centre_url
    VAR @Footer_text_2_body
    VAR @Terms_and_conditions_copy
    VAR @Terms_and_conditions_url
    VAR @Footer_Email
    SET @BU = Language
    
    IF @BU == "en_GB" OR @BU == "en_AU" OR @BU == "en_US" OR @BU == "en_CA" OR @BU == "fr_CA" OR @BU == "en_SG" OR @BU == "es_MX" OR @BU == "en_MX" OR @BU == "en_MY" OR @BU == "zn_HK" OR @BU == "en_HK" OR @BU == "de_DE" OR @BU == "en_DE" OR @BU == "fr_FR" OR @BU == "en_FR" OR @BU == "zn_SG"
    THEN SET @BU = Language
    ELSE SET @BU = "en_MY"
    ENDIF
    
    SET @From_name= LOOKUP ("Abandon Basket Malaysia","From_name","BU",@BU)
    SET @Subjectline= LOOKUP ("Abandon Basket Malaysia","Subjectline","BU",@BU)
    SET @Preview_Text= LOOKUP ("Abandon Basket Malaysia","Preview_Text","BU",@BU)
    SET @Header_0= LOOKUP ("Abandon Basket Malaysia","Header_0","BU",@BU)
    SET @Header_1= LOOKUP ("Abandon Basket Malaysia","Header_1","BU",@BU)
    SET @Logo_url= LOOKUP ("Abandon Basket Malaysia","Logo_url","BU",@BU)
    SET @Inspire_copy= LOOKUP ("Abandon Basket Malaysia","Inspire_copy","BU",@BU)
    SET @Discover_copy= LOOKUP ("Abandon Basket Malaysia","Discover_copy","BU",@BU)
    SET @Connect_copy= LOOKUP ("Abandon Basket Malaysia","Connect_copy","BU",@BU)
    SET @Inspire_url= LOOKUP ("Abandon Basket Malaysia","Inspire_url","BU",@BU)
    SET @Discover_url= LOOKUP ("Abandon Basket Malaysia","Discover_url","BU",@BU)
    SET @Connect_url= LOOKUP ("Abandon Basket Malaysia","Connect_url","BU",@BU)
    SET @Hero_url= LOOKUP ("Abandon Basket Malaysia","Hero_url","BU",@BU)
    SET @Salutation_copy_1= LOOKUP ("Abandon Basket Malaysia","Salutation_copy_1","BU",@BU)
    SET @Body_1= LOOKUP ("Abandon Basket Malaysia","Body_1","BU",@BU)
    SET @Singular_item= LOOKUP ("Abandon Basket Malaysia","Singular_item","BU",@BU)
    SET @Plural_items= LOOKUP ("Abandon Basket Malaysia","Plural_items","BU",@BU)
    SET @In_your_bag= LOOKUP ("Abandon Basket Malaysia","In_your_bag","BU",@BU)
    SET @Quantity = LOOKUP ("Abandon Basket Malaysia","Quantity","BU",@BU)
    SET @Currency= LOOKUP ("Abandon Basket Malaysia","Currency","BU",@BU)
    SET @Subtotal= LOOKUP ("Abandon Basket Malaysia","Subtotal","BU",@BU)
    SET @Total= LOOKUP ("Abandon Basket Malaysia","Total","BU",@BU)
    SET @CTA_copy= LOOKUP ("Abandon Basket Malaysia","CTA_copy","BU",@BU)
    
    SET @Guest_Order = Guest_Order
    SET @Block_title_1 = Lookup("Abandon Basket Malaysia","Block_title1","BU",@BU) 
    SET @Block_title_2 = Lookup("Abandon Basket Malaysia","Block_title2","BU",@BU) 
    SET @Block_title_url = Lookup("Abandon Basket Malaysia","Block_title_url","BU",@BU) 
    SET @Block_copy = Lookup("Abandon Basket Malaysia","Block_copy","BU",@BU) 
    SET @Block_sub_copy1 = Lookup("Abandon Basket Malaysia","Block_sub_copy1","BU",@BU) 
    SET @Block_sub_copy2 = Lookup("Abandon Basket Malaysia","Block_sub_copy2","BU",@BU)
    SET @Block_sub_url = Lookup("Abandon Basket Malaysia","Block_sub_url","BU",@BU)
    
    SET @Block_1_a = Lookup("Abandon Basket Malaysia","Block_title1_a","BU",@BU)
    SET @Block_2_a = Lookup("Abandon Basket Malaysia","Block_title2_a","BU",@BU)
    SET @Block_url_a = Lookup("Abandon Basket Malaysia","Block_title_url_a","BU",@BU)
    SET @Block_a = Lookup("Abandon Basket Malaysia","Block_copy_a","BU",@BU)
    
    SET @Phone_number= LOOKUP ("Abandon Basket Malaysia","Phone_number","BU",@BU)
    SET @Postal_address= LOOKUP ("Abandon Basket Malaysia","Postal_address","BU",@BU)
    SET @Instagram_link= LOOKUP ("Abandon Basket Malaysia","Instagram_link","BU",@BU)
    SET @Facebook_link= LOOKUP ("Abandon Basket Malaysia","Facebook_link","BU",@BU)
    SET @Twitter_link= LOOKUP ("Abandon Basket Malaysia","Twitter_link","BU",@BU)
    SET @Youtube_link= LOOKUP ("Abandon Basket Malaysia","Youtube_link","BU",@BU)
    SET @Pintrest_link= LOOKUP ("Abandon Basket Malaysia","Pintrest_link","BU",@BU)
    SET @Preference_copy= LOOKUP ("Abandon Basket Malaysia","Preference_copy","BU",@BU)
    SET @Preference_url= LOOKUP ("Abandon Basket Malaysia","Preference_url","BU",@BU)
    SET @Copyright= LOOKUP ("Abandon Basket Malaysia","Copyright","BU",@BU)
    SET @Footer_text_1_body= LOOKUP ("Abandon Basket Malaysia","Footer_text_1_body","BU",@BU)
    SET @Privacy_policy_copy= LOOKUP ("Abandon Basket Malaysia","Privacy_policy_copy","BU",@BU)
    SET @Privacy_policy_url= LOOKUP ("Abandon Basket Malaysia","Privacy_policy_url","BU",@BU)
    SET @Preference_centre_copy= LOOKUP ("Abandon Basket Malaysia","Preference_centre_copy","BU",@BU)
    SET @Preference_centre_url= LOOKUP ("Abandon Basket Malaysia","Preference_centre_url","BU",@BU)
    SET @Footer_text_2_body= LOOKUP ("Abandon Basket Malaysia","Footer_text_2_body","BU",@BU)
    SET @Terms_and_conditions_copy= LOOKUP ("Abandon Basket Malaysia","Terms_and_conditions_copy","BU",@BU)
    SET @Terms_and_conditions_url= LOOKUP ("Abandon Basket Malaysia","Terms_and_conditions_url","BU",@BU)
    SET @Footer_Email= LOOKUP ("Abandon Basket Malaysia","Footer_Email","BU",@BU)
    ]%%
    <style type="text/css">
    body {
    margin: 0 !important;
    padding: 0 !important;
    -webkit-text-size-adjust: 100% !important;
    -ms-text-size-adjust: 100% !important;
    -webkit-font-smoothing: antialiased !important;
    }
    img {
    border: 0 !important;
    outline: none !important;
    }
    p {
    margin: 0px !important;
    padding: 0px !important;
    }
    table {
    border-collapse: collapse;
    mso-table-lspace: 0px;
    mso-table-rspace: 0px;
    }
    td, a, span {
    border-collapse: collapse;
    mso-line-height-rule: exactly;
    }
    .ExternalClass * {
    line-height: 100%;
    }
    div, button {
    display: block !important;
    }
    .ins a {
    color: #333333;
    text-decoration: none;
    }
    .footer a {
    color: #797979;
    text-decoration: none;
    }
    .copy a {
    color: #333333;
    text-decoration: none;
    }
    .jac a {
    color: #333333;
    text-decoration: none;
    }
    .las a {
    color: #333333;
    text-decoration: none;
    }
    .lasp a {
    color: #333333;
    text-decoration: none;
    }
    .copy12 a {
    color: #333333;
    text-decoration: none;
    }
    .copy001 a {
    color: #333333;
    text-decoration: none;
    }
    .crab a {
    color: #333333;
    text-decoration: none;
    }
    .homemade a {
    color: #333333;
    text-decoration: none;
    }
    .create a {
    color: #333333;
    text-decoration: none;
    }
    .deli a {
    color: #333333;
    text-decoration: none;
    }
    .use a {
    color: #666666;
    text-decoration: none;
    }
    .manage a {
    color: #666666;
    text-decoration: none;
    }
    .pls a {
    color: #666666 !important;
    text-decoration: none;
    }
    .pound a {
    color: #666666;
    text-decoration: none;
    }
    .filled a {
    color: #ffffff;
    text-decoration: none;
    }
    .ort1 a
    {
    color: #333333;
    text-decoration: none;
    }
    .become a {
    color: #ffffff;
    text-decoration: none;
    }
    .account a {
    color: #ffffff;
    text-decoration: none;
    }
    .crabtree a {
    color: #ffffff;
    text-decoration: none;
    }
    .hero_crab a
    {
    color: #333333;
    text-decoration: none;
    }
    .white12 a {
    color: #ffffff;
    text-decoration: none;
    }
    .date a {
    color: #ffffff;
    text-decoration: none;
    }
    .thur a {
    color: #333333;
    text-decoration: none;
    }
    .order a {
    color: #333333;
    text-decoration: none;
    }
    .argan a {
    color: #333333;
    text-decoration: none;
    }
    .ml a {
    color: #333333;
    text-decoration: none;
    }
    .hand a {
    color: #333333;
    text-decoration: none;
    }
    .dis a {
    color: #333333;
    text-decoration: none;
    }
    .lyn a {
    color: #333333;
    text-decoration: none;
    }
    .total a {
    color: #333333;
    text-decoration: none;
    }
    .value a {
    color: #333333;
    text-decoration: none;
    }
    .tal a {
    color: #333333;
    text-decoration: none;
    }
    .price a {
    color: #333333;
    text-decoration: none;
    }
    .method a {
    color: #333333;
    text-decoration: none;
    }
    .exp a {
    color: #333333;
    text-decoration: none;
    }
    .reg a {
    color: #333333;
    text-decoration: none;
    }
    .y_bag a {
    color: #333333;
    text-decoration: none;
    }
    .bag a {
    color: #8c5cba;
    text-decoration: none;
    }
    @media only screen and (min-width:481px) and (max-width:599px) {
    .wrapper {
    width: 100% !important;
    }
    .aside {
    width: 15px !important;
    }
    .hide {
    display: none !important;
    }
    .full_img {
    width: 100% !important;
    height: auto !important;
    max-width: 100% !important;
    }
    .pls {
    display: none !important;
    }
    .footer {
    padding: 15px 10px !important;
    }
    .spc_10 {
    height: 10px !important;
    }
    .ins {
    font-size: 14px !important;
    line-height: 20px !important;
    }
    .jac {
    font-size: 16px !important;
    line-height: 28px !important;
    }
    .lyn {
    font-size: 16px !important;
    line-height: 24px !important;
    }
    .reg {
    font-size: 14px !important;
    line-height: 24px !important;
    }
    .las {
    font-size: 18px !important;
    line-height: 24px !important;
    }
    .lasp {
    font-size: 24px !important;
    line-height: 30px !important;
    padding: 10px 0px 0px 0px !important;
    }
    .pound {
    font-size: 24px !important;
    line-height: 30px !important;
    }
    .use, .use a {
    font-size: 14px !important;
    line-height: 24px !important;
    }
    .spc_25 {
    height: 25px !important;
    }
    .spc_15 {
    height: 15px !important;
    }
    .spc_36 {
    height: 36px !important;
    }
    .homemade {
    font-size: 22px !important;
    line-height: 30px !important;
    }
    .copy12, .copy12 a {
    text-align: center !important;
    font-size: 14px !important;
    line-height: 24px !important;
    height: auto !important;
    }
    .crab {
    padding: 0px 30px 20px 30px !important;
    text-align: center !important;
    font-size: 14px !important;
    line-height: 24px !important;
    height:auto !important;
    }
    .manage {
    text-align: center !important;
    padding: 25px 0px !important;
    }
    .icon {
    width: 42px !important;
    height: auto !important;
    max-width: 42px !important;
    }
    .bo_bottom {
    border-bottom: #53c397 2px solid !important;
    padding-bottom: 30px !important;
    }
    .spc_30 {
    height: 30px !important;
    }
    .wrap_375 {
    width: 375px !important;
    }
    .total {
    font-size: 16px !important;
    line-height: 24px !important;
    font-weight: normal !important;
    }
    td .display_mobile {
    display: block !important;
    height: auto !important;
    }
    div .display_mobile {
    display: table !important;
    float: none !important;
    width: 100% !important;
    overflow: visible !important;
    height: auto !important;
    }
    .dis {
    font-size: 16px !important;
    line-height: 28px !important;
    }
    .aside_20 {
    width: 20px !important;
    }
    .mob_bg {
    background-image: none !important;
    background-color: #ccf1e4 !important;
    }
    .mob_bg_pink {
    background-image: none !important;
    background-color: #c06078 !important;
    }
    .mob_bg2 {
    background-image: none !important;
    background-color: #e17040 !important;
    }
    .spc_60 {
    height: 100px !important;
    }
    .crabtree , .crabtree a {
    font-size: 30px !important;
    line-height: 31px !important;
    }
    .become , .become a
    {
    font-size: 30px !important;
    line-height: 31px !important;
    }
    .filled , .filled a {
    font-size: 16px !important;
    padding-top: 10px !important;
    line-height: 24px !important;
    }
    .account, .account a {
    padding-top: 10px !important;
    font-size: 16px !important;
    line-height: 24px !important;
    }
    .create {
    font-size: 16px !important;
    line-height: 24px !important;
    }
    .value {
    text-align: right !important;
    font-size: 16px !important;
    line-height: 24px !important;
    }
    .price {
    text-align: right !important;
    font-size: 18px !important;
    line-height: 24px !important;
    }
    .tal {
    font-size: 18px !important;
    line-height: 24px !important;
    }
    .method {
    font-size: 14px !important;
    line-height: 24px !important;
    font-weight: bold !important;
    text-align: right !important;
    }
    .thur, .deli {
    text-align: center !important;
    font-size: 14px !important;
    line-height: 24px !important;
    }
    .border_1 {
    border-top: #d9d9d9 1px solid !important;
    }
    .spc20 {
    height: 20px !important;
    }
    .spc_5 {
    height: 5px !important;
    }
    }
    @media only screen and (max-width:480px) {
    
    .spc20 {
    height: 20px !important;
    }
    .spc_5 {
    height: 5px !important;
    }  
    .wrapper {
    width: 100% !important;
    }
    .aside {
    width: 15px !important;
    }
    .hide {
    display: none !important;
    }
    .full_img {
    width: 100% !important;
    height: auto !important;
    max-width: 100% !important;
    }
    .pls {
    display: none !important;
    }
    .footer {
    padding: 15px 10px !important;
    }
    .spc_10 {
    height: 10px !important;
    }
    .spc_36 {
    height: 36px !important;
    }
    .ins {
    font-size: 14px !important;
    line-height: 20px !important;
    }
    .use, .use a {
    font-size: 14px !important;
    line-height: 24px !important;
    }
    .lasp {
    font-size: 24px !important;
    line-height: 30px !important;
    padding: 10px 0px 0px 0px !important;
    }
    .jac {
    font-size: 16px !important;
    line-height: 28px !important;
    }
    .lyn {
    font-size: 16px !important;
    line-height: 24px !important;
    }
    .reg {
    font-size: 14px !important;
    line-height: 24px !important;
    }
    .las {
    font-size: 18px !important;
    line-height: 24px !important;
    }
    .pound {
    font-size: 24px !important;
    line-height: 30px !important;
    }
    .spc_25 {
    height: 25px !important;
    }
    .spc_15 {
    height: 15px !important;
    }
    .homemade {
    font-size: 22px !important;
    line-height: 30px !important;
    }
    .copy12 {
    text-align: center !important;
    font-size: 14px !important;
    line-height: 24px !important;
    }
    .crab {
    padding: 0px 30px 10px 30px !important;
    text-align: center !important;
    font-size: 14px !important;
    line-height: 24px !important;
    }
    .total {
    font-size: 16px !important;
    line-height: 24px !important;
    font-weight: normal !important;
    }
    .manage {
    text-align: center !important;
    padding: 25px 0px !important;
    }
    .icon {
    width: 42px !important;
    height: auto !important;
    max-width: 42px !important;
    }
    .bo_bottom {
    border-bottom: #53c397 2px solid !important;
    padding-bottom: 30px !important;
    }
    .spc_30 {
    height: 30px !important;
    }
    .wrap_375 {
    width: 100% !important;
    }
    .displaytd {
    display: block !important;
    height: auto !important;
    }
    .displaydiv {
    display: table !important;
    float: none !important;
    width: 100% !important;
    overflow: visible !important;
    height: auto !important;
    }
    .aside_20 {
    width: 20px !important;
    }
    .mob_bg {
    background-image: none !important;
    background-color: #ccf1e4 !important;
    }
    .mob_bg_pink {
    background-image: none !important;
    background-color: #c06078 !important;
    }
    .mob_bg2 {
    background-image: none !important;
    background-color: #e17040 !important;
    }
    .spc_60 {
    height: 60px !important;
    }
    .crabtree , .crabtree a {
    font-size: 30px !important;
    line-height: 31px !important;
    }
    .become , .become a
    {
    font-size: 30px !important;
    line-height: 31px !important;
    }
    .filled , .filled a {
    font-size: 16px !important;
    padding-top: 10px !important;
    line-height: 24px !important;
    }
    .create {
    font-size: 16px !important;
    line-height: 24px !important;
    }
    .value {
    text-align: right !important;
    font-size: 16px !important;
    line-height: 24px !important;
    }
    .price {
    text-align: right !important;
    font-size: 18px !important;
    line-height: 24px !important;
    }
    .tal {
    font-size: 18px !important;
    line-height: 24px !important;
    }
    .method {
    font-size: 14px !important;
    line-height: 24px !important;
    font-weight: bold !important;
    text-align: right !important;
    }
    .thur, .deli {
    text-align: center !important;
    font-size: 14px !important;
    line-height: 24px !important;
    }
    .border_1 {
    border-top: #d9d9d9 1px solid !important;
    }
    .account, .account a {
    padding-top: 10px !important;
    font-size: 16px !important;
    line-height: 24px !important;
    }
    }
    </style>
    </head><body style="margin:0px; padding:0px;" bgcolor="#f9f9f9">
    
    
    <custom name="opencounter" type="tracking">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f9" style="background-color:#f9f9f9;">
    <tr>
    <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="wrapper">
    <tr>
    <td height="40" class="hide">&nbsp;</td>
    </tr>
    <tr>
    <td align="left" valign="top" class="pls" style="padding:0px 0px 5px 0px;font-size:10px;line-height:12px; text-decoration:none;font-family:'WorkSans',Arial, Helvetica, sans-serif; color:#666666;">%%=TreatAsContent(@Header_0)=%% </td>
    </tr>
    <tr>
    <td height="10" style="line-height:0px;font-size:0px;" class="spc_10">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#bbe2d4" style="background-color:#bbe2d4;">
    <tr>
    <td width="20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td height="30">&nbsp;</td>
    </tr>
    <tr>
    <td align="center"><a href="%%=RedirectTo(@Logo_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/logo11" width="249" height="32" style="display:block;max-width:249px;" alt="CRABTREE AND EVELYN LONDON" border="0" /></a></td>
    </tr>
    <tr>
    <td align="center"><table width="240" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td width="65" align="left" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;" class="ins"><a href="%%=RedirectTo(@Inspire_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-right:15px;"  class="ins">%%=v(@Inspire_copy)=%% </a></td>
    <td width="2" style="color:#53c397;font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif;" align="center">|</td>
    <td  align="center" width="96" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;"><a href="%%=RedirectTo(@Discover_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-right:15px;padding-left:15px;"  class="ins">%%=v(@Discover_copy)=%% </a></td>
    <td width="2" style="color:#53c397;font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif;" align="center">|</td>
    <td style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;" align="right" width="75"><a href="%%=RedirectTo(@Connect_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-left:15px;"  class="ins"> %%=v(@Connect_copy)=%%</a></td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    <td width="20">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
    <tr>
    <td><img src="http://media.crabtree-evelyn.com/i/crabtree_evelyn/hero_banner" alt="" width="600"  class="full_img" style="display:block;max-width:600px;" border="0"  /></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
    <tr>
    <td>%%[VAR @FirstName SET @FirstName = FirstName]%%
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td width="40" class="aside_20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="30" class="spc_30">&nbsp;</td>
    </tr>
    <tr>
    <td align="center"><table width="380" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
    <tr>
    <td style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" align="center" class="jac">%%=v(@Salutation_copy_1)=%% <span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="jac">%%=propercase(@FirstName)=%%,</span><br />
    <br />
    %%=v(@Body_1)=%% </td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td height="40">&nbsp;</td>
    </tr>
    </table></td>
    <td width="40" class="aside_20">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td  bgcolor="#f9f9f9" height="12" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    <tr>
    <td ><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
    <tr>
    <td style="line-height:0px;font-size:0px;" height="6" valign="top"><img src="http://media.crabtree-evelyn.com/i/crabtree_evelyn/section_boder" alt="" width="600" height="6" class="full_img"  style="display:block;max-width:600px;" border="0"  /></td>
    </tr>
    <tr>
    <td><custom name="opencounter" type="tracking">%%[Set @url = Concat('https://d1y9qtn9cuc3xw.cloudfront.net/eruqax8z/content/email/?k=6zp18cj&f=cart_html&e=',URLEncode([emailaddr],1))]%%
    %%=HTTPGet(@url)=%%</custom></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td  bgcolor="#f9f9f9" height="12" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    <tr>
    <td >%%[IF @Guest_Order == "True" THEN]%%
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#c06078">
    <!--[if !mso 9]><!-->
    
    <tr>
    <td align="center"  height="0" class="displaytd" style="display:none;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none;width:0;overflow:hidden;max-height:0px !important;background-color:#ffffff;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/61aa26d6-9a33-4202-8ffc-317fb73ba48d.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
    </tr>
    
    <!--<![endif]-->
    <tr>
    <td class="mob_bg_pink"  valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td width="35" class="aside_20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="50" class="spc20" >&nbsp;</td>
    </tr>
    <tr>
    <td align="left" style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;" class="crabtree" ><a href="%%=REDIRECTTO(@Block_url_a)=%%" target="_blank" style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;">%%=v(@Block_1_a)=%% </a><a href="%%=REDIRECTTO(@Block_url_a)=%%" target="_blank" style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:normal;" class="crabtree">%%=v(@Block_2_a)=%%</a> <a href="%%=REDIRECTTO(@Block_url_a)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/arrow2" width="18" height="18" alt="" style="display:inline-block;max-width:18px;" border="0"  /></a></td>
    </tr>
    <tr>
    <td height="5" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    <tr>
    <td align="left" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="filled"><a href="%%=REDIRECTTO(@Block_url_a)=%%" target="_blank" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="filled">%%=v(@Block_a)=%%</a></td>
    </tr>
    <tr>
    <td height="22" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    <tr>
    <td  align="left" style="line-height:0px;font-size:0px;" height="3"><table width="37" border="0" cellspacing="0" cellpadding="0" align="left" height="3" style="line-height:0px;font-size:0px;">
    <tr>
    <td height="3" bgcolor="#ffffff" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td height="1"  class="spc_5"  style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    
    </table></td>
    <td width="175" valign="top"  class="aside_20" style="padding-bottom:5px;"><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/b7254456-bf00-4c9c-b655-2a6d2074f478.jpg" width="175" height="182" class="hide" style="display:block;" border="0" /></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td class="hide" bgcolor="#ffffff"><img
    src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/59e567ce-63d2-4931-9035-fe5ebdcbc569.jpg" width="600" height="124" style="display:block;" border="0" /></td>
    </tr>
    </table>
    </td>
    </tr>
    <!--[if !mso 9]><!-->
    
    <tr>
    <td align="center"  height="0" class="displaytd" style="display:none;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none;width:0;overflow:hidden;max-height:0px !important;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/4084c770-250e-43b4-b951-545ace2d0b86.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
    </tr>
    
    <!--<![endif]-->
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
    <tr>
    <td width="44" class="aside_20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
    <td height="30">&nbsp;</td>
    </tr>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
    <tr>
    <td width="48" align="left" valign="top" ><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/0307e504-bcfe-4eca-9b14-93db08961ff7.png" alt="" width="48" height="48"  style="display:block;max-width:48px;" border="0" /></td>
    <td width="25">&nbsp;</td>
    <td valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;"  align="left" class="create"><a href="%%=redirectto(@Block_sub_url)=%%" target="_blank" style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="create">%%=v(@Block_sub_copy1)=%% <span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:normal;" class="create">%%=v(@Block_sub_copy2)=%%</span> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/166dc463-9585-4a7c-8596-07b5be7061b1.jpg" width="6" height="8" style="display:inline-block;max-width:8px;" border="0" /></a></td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td height="46">&nbsp;</td>
    </tr>
    </table></td>
    <td width="44" class="aside_20">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    </table>
    %%[ELSE]%%
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td ><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#e17040">
    <!--[if !mso 9]><!-->
    
    <tr>
    <td align="center"  height="0" class="displaytd" style="display:none ;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none ;width:0;overflow:hidden;max-height:0px !important;background-color:#ffffff;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/bd793baa-d480-4dcf-9aa0-114a441951c9.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
    </tr>
    
    <!--<![endif]-->
    <tr>
    <td   class="mob_bg2" bgcolor="#e17040"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="35" class="aside_20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td height="50"  class="spc20" >&nbsp;</td>
    </tr>
    <tr>
    <td align="left" style="font-size:30px;line-height:31px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;" class="become" ><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:30px;line-height:31px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;" class="become">%%=v(@Block_title_1)=%%</a> <a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:30px;line-height:31px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:normal;" class="become">%%=v(@Block_title_2)=%%</a> <a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/arrow2" width="18" height="18" alt="" style="display:inline-block;max-width:18px;" border="0"  /></a></td>
    </tr>
    <tr>
    <td height="5" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    <tr>
    <td align="left" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="account"><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="account">%%=v(@Block_copy)=%%</a></td>
    </tr>
    <tr>
    <td height="18" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    <tr>
    <td  align="left" style="line-height:0px;font-size:0px;" height="3"><table width="37" border="0" cellspacing="0" cellpadding="0" align="left" height="3" style="line-height:0px;font-size:0px;">
    <tr>
    <td height="3" bgcolor="#ffffff" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td height="1" style="line-height:0px;font-size:0px;" class="spc_5" >&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    
    </table></td>
    <td width="175" class="aside_20" valign="top" style="padding-bottom:5px;"><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/46fec4ff-a653-4c10-a52c-9c540a697bec.jpg" alt="" width="175" height="220" class="hide" style="display:block;max-width:175px;" border="0" /></td>
    </tr>
    </table></td>
    </tr>
    
    </table></td>
    </tr>
    <tr>
    <td class="hide" bgcolor="#ffffff"><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/546994b9-c781-4c55-a250-d63d40c1afe8.jpg" alt="" width="600" height="99" style="display:block;" border="0" /></td>
    </tr>
    </table>
    
    </td>
    </tr>
    <!--[if !mso 9]><!-->
    
    <tr>
    <td align="center"  height="0" class="displaytd" style="display:none ;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none ;width:0;overflow:hidden;max-height:0px !important;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/3189d6b2-80e2-457a-86a2-407f5cac85f7.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
    </tr>
    
    <!--<![endif]-->
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
    <tr>
    <td width="44" class="aside_20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
    <td height="30">&nbsp;</td>
    </tr>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
    <tr>
    <td width="48" align="left" valign="top" ><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/0307e504-bcfe-4eca-9b14-93db08961ff7.png" alt="" width="48" height="48"  style="display:block;max-width:48px;" border="0" /></td>
    <td width="25">&nbsp;</td>
    <td valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;"  align="left" class="create"><a href="%%=redirectto(@Block_sub_url)=%%" target="_blank" style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="create">%%=v(@Block_sub_copy1)=%% <span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:normal;" class="create">%%=v(@Block_sub_copy2)=%%</span> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/166dc463-9585-4a7c-8596-07b5be7061b1.jpg" width="6" height="8" style="display:inline-block;max-width:8px;" border="0" /></a></td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td height="46">&nbsp;</td>
    </tr>
    </table></td>
    <td width="44" class="aside_20">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    </table>
    %%[ENDIF]%%</td>
    </tr>
    <tr>
    <td  bgcolor="#f9f9f9" height="12" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#bae1d3" style="overflow:hidden;">
    <tr>
    <td width="40" class="aside">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td style="padding:30px 0px 0px 0px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td><table width="250" border="0" cellspacing="0" cellpadding="0" align="right" class="wrapper">
    <tr>
    <td valign="top" class="bo_bottom" style="padding-bottom:90px;" ><table width="250" border="0" cellspacing="0" cellpadding="0" align="center" class="wrap_375" >
    <tr>
    <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Instagram_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/instagram1" alt="insta" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
    <td width="17">&nbsp;</td>
    <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Facebook_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/facebook1" alt="fb" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
    <td width="17">&nbsp;</td>
    <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Twitter_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/twitter1" alt="tw" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
    <td width="17">&nbsp;</td>
    <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Youtube_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/youtube1" alt="yt" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
    <td width="18">&nbsp;</td>
    <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Pintrest_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/pinterest1" alt="pint" width="36" height="36" style="display:block;max-width:36px;"  border="0"  class="icon" /></a></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td  align="left" valign="top" 
    class="manage" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-bottom:20px;"><a href="%%=REDIRECTTO(@Preference_url)=%%" target="_blank" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;" ></a></td>
    </tr>
    </table>
    <table width="220" border="0" cellspacing="0" cellpadding="0" align="left" class="wrapper">
    <tr>
    <td align="left" valign="top" class="crab" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" height="105">%%=v(@Postal_address)=%% </td>
    </tr>
    <tr>
    <td align="left" valign="top" class="copy12" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;"><a href="tel:%%=v(@phone_number)=%%" target="_blank" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;">%%=v(@phone_number)=%%</a><br />
    <a href="mailto:%%=v(@Footer_Email)=%%" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;"> %%=v(@Footer_Email)=%%</a></td>
    </tr>
    <tr>
    <td height="20" style="line-height:0px;font-size:0px;" class="spc_25">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    </tr>
    </table></td>
    <td width="40" class="aside">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#bae1d3" style="overflow:hidden;">
    <tr>
    <td width="10" class="aside">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="5" style="line-height:0px;font-size:0px;" class="hide">&nbsp;</td>
    </tr>
    <tr>
    <td bgcolor="#53c397" style="line-height:0px;font-size:0px;" height="1"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer2" width="1" height="1" style="display:block;" border="0" /></td>
    </tr>
    <tr>
    <td height="10" style="line-height:0px;font-size:0px;" class="spc_30">&nbsp;</td>
    </tr>
    <tr>
    <td align="center"><a href="%%=RedirectTo(@Logo_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/tree" width="37" alt="Crabtree and Evelyn" height="36" style="display:block;max-width:37px;"  border="0" /></a></td>
    </tr>
    <tr>
    <td height="10" style="line-height:0px;font-size:0px;">&nbsp;</td>
    </tr>
    <tr>
    <td align="center" style="font-size:12px;line-height:14px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" class="copy">%%=v(@Copyright)=%%</td>
    </tr>
    <tr>
    <td height="15" style="line-height:0px;font-size:0px;" class="spc_30">&nbsp;</td>
    </tr>
    </table></td>
    <td width="10" class="aside">&nbsp;</td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td height="7" style="line-height:0px;font-size:0px;" bgcolor="#53c397"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer2" width="1" height="1" style="display:block;" border="0" /></td>
    </tr>
    <tr>
    <td align="left" style="padding:15px 0px 10px 0px;font-size:10px;line-height:14px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#797979;" class="footer">%%=TreatAsContent(@Footer_text_1_body)=%%<br />
    <br />
    %%=TreatAsContent(@Footer_text_2_body)=%% </td>
    </tr>
    <tr>
    <td height="20" >&nbsp;</td>
    </tr>
    <tr>
    <td style="line-height:1px; font-size:1px;" class="hide"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer" height="1"  width="600" style="max-height:1px; min-height:1px; display:block; width:600px; min-width:600px;" border="0" /></td>
    </tr>
    </table></td>
    </tr>
    <tr>
    <td style="line-height:1px; font-size:1px;" class="hide"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer" height="1"  width="600" style="max-height:1px; min-height:1px; display:block; width:600px; min-width:600px;" border="0" /></td>
    </tr>
    </table></td>
    </tr>
    </table>
    <div style="display:none !important; white-space:nowrap; font:20px courier; color:#ffffff;">- - - - - - - - - - - - - - - - - - - - - -</div>
    </body>
    </html>
    */

    /*<---------------------------------- Back in Stock Template---------------------------------------------> */
    /* 
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>%%=v(@Subjectline)=%%</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0 " />
<meta name="format-detection" content="telephone=no">
 %%[
    VAR @BU
    VAR @From_name
    VAR @Subjectline
    VAR @Preview_Text
    VAR @Header_0
    VAR @Header_2
    VAR @Logo_url
    VAR @Inspire_copy
    VAR @Discover_copy
    VAR @Connect_copy
    VAR @Inspire_url
    VAR @Discover_url
    VAR @Connect_url
    VAR @Hero_url
    VAR @Hero_text_1
    VAR @Hero_text_2
    VAR @Salutation_copy_1
    VAR @Body_1
    VAR @Currency
    VAR @CTA_copy
    VAR @CTA_URL
    VAR @Block_title_1
    VAR @Block_title_2
    VAR @Block_title_url
    VAR @Block_copy
    VAR @Block_sub_copy_1
    VAR @Block_sub_copy_2
    VAR @Block_sub_url
    VAR @phone_number
    VAR @Postal_address
    VAR @Instagram_link
    VAR @Facebook_link
    VAR @Twitter_link
    VAR @Youtube_linkst_link
    VAR @Preference_copy
    VAR @Preference_url
    VAR @Copyright
    VAR @Footer_text_1_body
    VAR @Privacy_policy_copy
    VAR @Privacy_policy_url
    VAR @Preference_centre_copy
    VAR @Preference_centre_url
    VAR @Footer_text_2_body
    VAR @Terms_and_conditions_copy
    VAR @Terms_and_conditions_url
    VAR @Footer_Email
    VAR @Block_title_1_a
    VAR @Block_title_2_a
    VAR @Block_title_url_a
    VAR @Block_copy_a
    SET @BU = Language
 
IF @BU == "en_GB" OR @BU == "en_AU" OR @BU == "en_US" OR @BU == "en_CA" OR @BU == "fr_CA" OR @BU == "en_SG" OR @BU == "es_MX" OR @BU == "en_MX" OR @BU == "en_MY" OR @BU == "zn_HK" OR @BU == "en_HK" OR @BU == "de_DE" OR @BU == "en_DE" OR @BU == "fr_FR" OR @BU == "en_FR" OR @BU == "zn_SG"
    THEN SET @BU = Language
    ELSE SET @BU = "en_GB"
    ENDIF
    SET @From_name = Lookup("Back in Stock Malaysia","From_name","BU",@BU)
    SET @Subjectline = Lookup("Back in Stock Malaysia","Subjectline","BU",@BU)
    SET @Preview_Text = Lookup("Back in Stock Malaysia","Preview_Text","BU",@BU)
    SET @Header_0 = Lookup("Back in Stock Malaysia","Header_0","BU",@BU)
    SET @Header_2 = Lookup("Back in Stock Malaysia","Header_2","BU",@BU)
    SET @Logo_url = Lookup("Back in Stock Malaysia","Logo_url","BU",@BU)
    SET @Inspire_copy = Lookup("Back in Stock Malaysia","Inspire_copy","BU",@BU)
    SET @Discover_copy = Lookup("Back in Stock Malaysia","Discover_copy","BU",@BU)
    SET @Connect_copy = Lookup("Back in Stock Malaysia","Connect_copy","BU",@BU)
    SET @Inspire_url = Lookup("Back in Stock Malaysia","Inspire_url","BU",@BU)
    SET @Discover_url = Lookup("Back in Stock Malaysia","Discover_url","BU",@BU)
    SET @Connect_url = Lookup("Back in Stock Malaysia","Connect_url","BU",@BU)
    SET @Hero_url = Lookup("Back in Stock Malaysia","Hero_url","BU",@BU)
    SET @Hero_text_1 = Lookup("Back in Stock Malaysia","Hero_text_1","BU",@BU)
    SET @Hero_text_2 = Lookup("Back in Stock Malaysia","Hero_text_2","BU",@BU)
    SET @Salutation_copy_1 = Lookup("Back in Stock Malaysia","Salutation_copy_1","BU",@BU)
    SET @Body_1 = Lookup("Back in Stock Malaysia","Body_1","BU",@BU)
    SET @Currency = Lookup("Back in Stock Malaysia","Currency","BU",@BU)
    SET @CTA_copy = Lookup("Back in Stock Malaysia","CTA_copy","BU",@BU)
    SET @CTA_URL = Product_URL
  
SET @Guest_Order = Guest_Order
SET @Block_title_1 = Lookup("Order_Confirmation_Malaysia","Block_title1","BU",@BU) 
SET @Block_title_2 = Lookup("Order_Confirmation_Malaysia","Block_title2","BU",@BU) 
SET @Block_title_url = Lookup("Order_Confirmation_Malaysia","Block_title_url","BU",@BU) 
SET @Block_copy = Lookup("Order_Confirmation_Malaysia","Block_copy","BU",@BU) 
SET @Block_sub_copy1 = Lookup("Order_Confirmation_Malaysia","Block_sub_copy1","BU",@BU) 
SET @Block_sub_copy2 = Lookup("Order_Confirmation_Malaysia","Block_sub_copy2","BU",@BU)
SET @Block_sub_url = Lookup("Order_Confirmation_Malaysia","Block_sub_url","BU",@BU)

SET @Block_1_a = Lookup("Order_Confirmation_Malaysia","Block_title1_a","BU",@BU)
SET @Block_2_a = Lookup("Order_Confirmation_Malaysia","Block_title2_a","BU",@BU)
SET @Block_url_a = Lookup("Order_Confirmation_Malaysia","Block_title_url_a","BU",@BU)
SET @Block_a = Lookup("Order_Confirmation_Malaysia","Block_copy_a","BU",@BU)
  
    SET @Block_sub_copy_1 = Lookup("Back in Stock Malaysia","Block_sub_copy_1","BU",@BU)
    SET @Block_sub_copy_2 = Lookup("Back in Stock Malaysia","Block_sub_copy_2","BU",@BU)
    SET @Block_sub_url = Lookup("Back in Stock Malaysia","Block_sub_url","BU",@BU)
    SET @phone_number = Lookup("Back in Stock Malaysia","phone_number","BU",@BU)
    SET @Postal_address = Lookup("Back in Stock Malaysia","Postal_address","BU",@BU)
    SET @Instagram_link = Lookup("Back in Stock Malaysia","Instagram_link","BU",@BU)
    SET @Facebook_link = Lookup("Back in Stock Malaysia","Facebook_link","BU",@BU)
    SET @Twitter_link = Lookup("Back in Stock Malaysia","Twitter_link","BU",@BU)
    SET @Youtube_link = Lookup("Back in Stock Malaysia","Youtube_link","BU",@BU)
    SET @Pintrest_link = Lookup("Back in Stock Malaysia","Pintrest_link","BU",@BU)
    SET @Preference_copy = Lookup("Back in Stock Malaysia","Preference_copy","BU",@BU)
    SET @Preference_url = Lookup("Back in Stock Malaysia","Preference_url","BU",@BU)
    SET @Copyright = Lookup("Back in Stock Malaysia","Copyright","BU",@BU)
    SET @Footer_text_1_body = Lookup("Back in Stock Malaysia","Footer_text_1_body","BU",@BU)
    SET @Privacy_policy_copy = Lookup("Back in Stock Malaysia","Privacy_policy_copy","BU",@BU)
    SET @Privacy_policy_url = Lookup("Back in Stock Malaysia","Privacy_policy_url","BU",@BU)
    SET @Preference_centre_copy = Lookup("Back in Stock Malaysia","Preference_centre_copy","BU",@BU)
    SET @Preference_centre_url = Lookup("Back in Stock Malaysia","Preference_centre_url","BU",@BU)
    SET @Footer_text_2_body = Lookup("Back in Stock Malaysia","Footer_text_2_body","BU",@BU)
    SET @Terms_and_conditions_copy = Lookup("Back in Stock Malaysia","Terms_and_conditions_copy","BU",@BU)
    SET @Terms_and_conditions_url = Lookup("Back in Stock Malaysia","Terms_and_conditions_url","BU",@BU)
    SET @Footer_Email = Lookup("Back in Stock Malaysia","Footer_Email","BU",@BU)
    SET @FirstName = FirstName
    SET @Guest_Order = Guest_Order
 ]%%
 <style type="text/css">
body {
 margin: 0 !important;
 padding: 0 !important;
 -webkit-text-size-adjust: 100% !important;
 -ms-text-size-adjust: 100% !important;
 -webkit-font-smoothing: antialiased !important;
}
img {
 border: 0 !important;
 outline: none !important;
}
p {
 margin: 0px !important;
 padding: 0px !important;
}
table {
 border-collapse: collapse;
 mso-table-lspace: 0px;
 mso-table-rspace: 0px;
}
td, a, span {
 border-collapse: collapse;
 mso-line-height-rule: exactly;
}
.ExternalClass * {
 line-height: 100%;
}
div, button {
 display: block !important;
}
.ins a {
 color: #333333;
 text-decoration: none;
}
.footer a {
 color: #797979;
 text-decoration: none;
}
.copy a {
 color: #333333;
 text-decoration: none;
}
.jac a {
 color: #333333;
 text-decoration: none;
}
.las a {
 color: #333333;
 text-decoration: none;
}
.lasp a {
 color: #333333;
 text-decoration: none;
}
.copy12 a {
 color: #333333;
 text-decoration: none;
}
.copy001 a {
 color: #333333;
 text-decoration: none;
}
.crab a {
 color: #333333;
 text-decoration: none;
}
.homemade a {
 color: #333333;
 text-decoration: none;
}
.create a {
 color: #333333;
 text-decoration: none;
}
.deli a {
 color: #333333;
 text-decoration: none;
}
.use a {
 color: #666666;
 text-decoration: none;
}
.manage a {
 color: #666666;
 text-decoration: none;
}
.pls a {
 color: #666666 !important;
 text-decoration: none;
}
.pound a {
 color: #666666;
 text-decoration: none;
}
.filled a {
 color: #ffffff;
 text-decoration: none;
}
.ort1 a
{
 color: #333333;
 text-decoration: none;
}
.become a {
 color: #ffffff;
 text-decoration: none;
}
.account a {
 color: #ffffff;
 text-decoration: none;
}
.crabtree a {
 color: #ffffff;
 text-decoration: none;
}
.hero_crab a
{
 color: #333333;
 text-decoration: none;
}
.white12 a {
 color: #ffffff;
 text-decoration: none;
}
.date a {
 color: #ffffff;
 text-decoration: none;


}

.thur a {
 color: #333333;
 text-decoration: none;
}
.order a {
 color: #333333;
 text-decoration: none;
}
.argan a {
 color: #333333;
 text-decoration: none;
}
.ml a {
 color: #333333;
 text-decoration: none;
}
.hand a {
 color: #333333;
 text-decoration: none;
}
.dis a {
 color: #333333;
 text-decoration: none;
}
.lyn a {
 color: #333333;
 text-decoration: none;
}
.total a {
 color: #333333;
 text-decoration: none;
}
.value a {
 color: #333333;
 text-decoration: none;
}
.tal a {
 color: #333333;
 text-decoration: none;
}
.price a {
 color: #333333;
 text-decoration: none;
}
.method a {
 color: #333333;
 text-decoration: none;
}
.exp a {
 color: #333333;
 text-decoration: none;
}
.reg a {
 color: #333333;
 text-decoration: none;
}
 @media only screen and (min-width:481px) and (max-width:599px) {
.wrapper {
 width: 100% !important;
}
.aside {
 width: 15px !important;
}
.hide {
 display: none !important;
}
.full_img {
 width: 100% !important;
 height: auto !important;
 max-width: 100% !important;
}
.pls {
 display: none !important;
}
.footer {
 padding: 15px 10px !important;
}
.spc_10 {
 height: 10px !important;
}
.ins {
 font-size: 14px !important;
 line-height: 20px !important;
}
.jac {
 font-size: 16px !important;
 line-height: 28px !important;
}
.lyn {
 font-size: 16px !important;
 line-height: 24px !important;
}
.reg {
 font-size: 14px !important;
 line-height: 24px !important;
}
.las {
 font-size: 18px !important;
 line-height: 24px !important;
}
.lasp {
 font-size: 24px !important;
 line-height: 30px !important;
 padding: 10px 0px 0px 0px !important;
}
.pound {
 font-size: 24px !important;
 line-height: 30px !important;
}
.use, .use a {
 font-size: 14px !important;
 line-height: 24px !important;
}
.spc_25 {
 height: 25px !important;
}
.spc_15 {
 height: 15px !important;
}
.spc_36 {
 height: 36px !important;
}
.homemade {
 font-size: 22px !important;
 line-height: 30px !important;
}
.copy12, .copy12 a {
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
 height: auto !important;
}
.crab {
 padding: 0px 30px 20px 30px !important;
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
 height:auto !important;
}
.manage {
 text-align: center !important;
 padding: 25px 0px !important;
}
.icon {
 width: 42px !important;
 height: auto !important;
 max-width: 42px !important;
}
.bo_bottom {
 border-bottom: #53c397 2px solid !important;
 padding-bottom: 30px !important;
}
.spc_30 {
 height: 30px !important;
}
.wrap_375 {
 width: 375px !important;
}
.total {
 font-size: 16px !important;
 line-height: 24px !important;
 font-weight: normal !important;
}
td .display_mobile {
 display: block !important;
 height: auto !important;
}
div .display_mobile {
 display: table !important;
 float: none !important;
 width: 100% !important;
 overflow: visible !important;
 height: auto !important;
}
.dis {
 font-size: 16px !important;
 line-height: 28px !important;
}
.aside_20 {
 width: 20px !important;
}
.mob_bg {
 background-image: none !important;
 background-color: #ccf1e4 !important;
}
.mob_bg2 {
 background-image: none !important;
 background-color: #e17040 !important;
}
.spc_60 {
 height: 100px !important;
}
.crabtree , .crabtree a {
 font-size: 30px !important;
 line-height: 31px !important;
}
.become , .become a
{
 font-size: 30px !important;
 line-height: 31px !important;
}
.filled , .filled a {
 font-size: 16px !important;
 padding-top: 10px !important;
 line-height: 24px !important;
}
.account, .account a {
 padding-top: 10px !important;
 font-size: 16px !important;
 line-height: 24px !important;
}
.create {
 font-size: 16px !important;
 line-height: 24px !important;
}
.value {
 text-align: right !important;
 font-size: 16px !important;
 line-height: 24px !important;
}
.price {
 text-align: right !important;
 font-size: 18px !important;
 line-height: 24px !important;
}
.tal {
 font-size: 18px !important;
 line-height: 24px !important;
}
.method {
 font-size: 14px !important;
 line-height: 24px !important;

 font-weight: bold !important;
 text-align: right !important;
}
.thur, .deli {
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
}
.border_1 {
 border-top: #d9d9d9 1px solid !important;
}
.mob_bg_pink {
 background-image: none !important;
 background-color: #c06078 !important;
}
.spc20 {
 height: 20px !important;
}
.spc_5 {
 height: 5px !important;
}
}
 @media only screen and (max-width:480px) {
.spc20 {
 height: 20px !important;
}
.spc_5 {
 height: 5px !important;
}
.wrapper {
 width: 100% !important;
}
.aside {
 width: 15px !important;
}
.hide {
 display: none !important;
}
.full_img {
 width: 100% !important;
 height: auto !important;
 max-width: 100% !important;
}
.pls {
 display: none !important;
}
.footer {
 padding: 15px 10px !important;
}
.spc_10 {
 height: 10px !important;
}
.spc_36 {
 height: 36px !important;
}
.ins {
 font-size: 14px !important;
 line-height: 20px !important;
}
.use, .use a {
 font-size: 14px !important;
 line-height: 24px !important;
}
.lasp {
 font-size: 24px !important;
 line-height: 30px !important;
 padding: 10px 0px 0px 0px !important;
}
.jac {
 font-size: 16px !important;
 line-height: 28px !important;
}
.lyn {
 font-size: 16px !important;
 line-height: 24px !important;
}
.reg {
 font-size: 14px !important;
 line-height: 24px !important;
}
.las {
 font-size: 18px !important;
 line-height: 24px !important;
}
.pound {
 font-size: 24px !important;
 line-height: 30px !important;
}
.spc_25 {
 height: 25px !important;
}
.spc_15 {
 height: 15px !important;
}
.homemade {
 font-size: 22px !important;
 line-height: 30px !important;
}
.copy12, .copy12 a {
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
 height: auto !important;
}
.crab {
 padding: 0px 30px 20px 30px !important;
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
  height:auto !important;
}
.total {
 font-size: 16px !important;
 line-height: 24px !important;
 font-weight: normal !important;
}
.manage {
 text-align: center !important;
 padding: 25px 0px !important;
}
.icon {
 width: 42px !important;
 height: auto !important;
 max-width: 42px !important;
}
.bo_bottom {
 border-bottom: #53c397 2px solid !important;
 padding-bottom: 30px !important;
}
.spc_30 {
 height: 30px !important;
}
.wrap_375 {
 width: 100% !important;
}
.displaytd {
 display: block !important;
 height: auto !important;
}
.displaydiv {
 display: table !important;
 float: none !important;
 width: 100% !important;
 overflow: visible !important;
 height: auto !important;
}
.aside_20 {
 width: 20px !important;
}
.mob_bg {
 background-image: none !important;
 background-color: #ccf1e4 !important;
}
.mob_bg2 {
 background-image: none !important;
 background-color: #e17040 !important;
}
.spc_60 {
 height: 60px !important;
}
.crabtree , .crabtree a {
 font-size: 30px !important;
 line-height: 31px !important;
}
.become , .become a
{
 font-size: 30px !important;
 line-height: 31px !important;
}
.filled , .filled a {
 font-size: 16px !important;
 padding-top: 10px !important;
 line-height: 24px !important;
}
.create {
 font-size: 16px !important;
 line-height: 24px !important;
}
.value {
 text-align: right !important;
 font-size: 16px !important;
 line-height: 24px !important;
}
.price {
 text-align: right !important;
 font-size: 18px !important;
 line-height: 24px !important;
}
.tal {
 font-size: 18px !important;
 line-height: 24px !important;
}
.method {
 font-size: 14px !important;
 line-height: 24px !important;
 font-weight: bold !important;
 text-align: right !important;
}
.thur, .deli {
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
}
.border_1 {
 border-top: #d9d9d9 1px solid !important;
}
.account, .account a {
 padding-top: 10px !important;
 font-size: 16px !important;
 line-height: 24px !important;
}
.mob_bg_pink {
 background-image: none !important;
 background-color: #c06078 !important;
}
}
</style>
 </head><body style="margin:0px; padding:0px;" bgcolor="#f9f9f9">
<custom name="opencounter" type="tracking">
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f9" style="background-color:#f9f9f9;">
   <tr>
    <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="wrapper">
                          <tr>
                            <td height="40" class="hide">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="left" valign="top" class="pls" style="padding:0px 0px 5px 0px;font-size:10px;line-height:12px; text-decoration:none;font-family:'WorkSans',Arial, Helvetica, sans-serif; color:#666666;">%%=TreatAsContent(@Header_0)=%% </td>
                          </tr>
                          <tr>
                            <td height="10" style="line-height:0px;font-size:0px;" class="spc_10">&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#bbe2d4" style="background-color:#bbe2d4;">
                          <tr>
                            <td width="20">&nbsp;</td>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                  <td height="30">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td align="center"><a href="%%=RedirectTo(@Logo_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/logo11" width="249" height="32" style="display:block;max-width:249px;" alt="CRABTREE AND EVELYN LONDON" border="0" /></a></td>
                                </tr>
                                    <tr>
                                  <td align="center"><table width="240" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr>
                                        <td width="65" align="left" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;" class="ins"><a href="%%=RedirectTo(@Inspire_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-right:15px;"  class="ins">%%=v(@Inspire_copy)=%% </a></td>
                                        <td width="2" style="color:#53c397;font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif;" align="center">|</td>
                                        <td  align="center" width="96" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;"><a href="%%=RedirectTo(@Discover_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-right:15px;padding-left:15px;"  class="ins">%%=v(@Discover_copy)=%% </a></td>
                                        <td width="2" style="color:#53c397;font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif;" align="center">|</td>
                                        <td style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;" align="right" width="75"><a href="%%=RedirectTo(@Connect_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-left:15px;"  class="ins"> %%=v(@Connect_copy)=%%</a></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            <td width="20">&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            
            
            </table></td>
        </tr>
       
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
              <tr>
                <td><img src="http://media.crabtree-evelyn.com/i/crabtree_evelyn/range_header" alt="" width="600"  class="full_img" style="display:block;max-width:600px;" border="0"  /></td>
              </tr>
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                      <td width="40" class="aside_20">&nbsp;</td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="50" class="spc_30">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center" style="font-size:30px;line-height:42px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" class="copy"><span style="font-size:30px;line-height:42px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;">%%=v(@Hero_text_1)=%% </span> %%=v(@Hero_text_2)=%%</td>
                          </tr>
                          <tr>
                            <td height="10" style="line-height:0px;font-size:0px;">&nbsp;</td>
                          </tr>
                          <tr>
                            <td  align="center" style="line-height:0px;font-size:0px;" height="3"><table width="36" border="0" cellspacing="0" cellpadding="0" align="center" height="3" style="line-height:0px;font-size:0px;">
                                <tr>
                                  <td height="3" bgcolor="#333333" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="spc_30">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center"><table width="380" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
                                <tr>
                                  <td style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" align="center" class="jac">%%=v(@Salutation_copy_1)=%% <span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="jac">%%=propercase(@FirstName)=%%,</span><br />
                                    <br />
                                    %%=v(@Body_1)=%% </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30">&nbsp;</td>
                          </tr>
                          
                        
                         
                         
                        </table></td>
                      <td width="40" class="aside_20">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td ><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" >
              <tr>
                <td width="45" class="aside_20">&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="center" ><table width="288" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
                          <tr>
                            <td style="border:#efefef 1px solid;" bgcolor="#f3f3f3" ><table width="286" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
                                <tr>
                                  <td align="center" bgcolor="#f3f3f3" ><table width="286" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper" bgcolor="#f3f3f3">
                                      <tr>
                                        <td align="center" valign="middle" style="padding:30px 0px 30px 0px;"><img src="%%Product_IMG%%" width="186"   style="display:block;max-width:286px;" alt="" class="full_img"  border="0" /></td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="wrapper" bgcolor="#ffffff">
                                      <tr>
                                        <td width="15">&nbsp;</td>
                                        <td align="center"><table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="wrapper">
                                            <tr>
                                              <td height="15" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left" valign="top" style="font-size:16px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="las" ><a href="%%=redirectto(@CTA_URL)=%%" target="_blank" style="font-size:16px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="las">%%Product_Title%%</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2" style="line-height:0px;font-size:0px;" >&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left" valign="top" style="font-size:22px;line-height:30px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" class="lasp" >%%=v(@Currency)=%%%%Total%%</td>
                                            </tr>
                                            <tr>
                                              <td height="15" style="line-height:0px;font-size:0px;" class="spc_25">&nbsp;</td>
                                            </tr>
                                          </table></td>
                                        <td width="15">&nbsp;</td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                     <tr>
                            <td height="36">&nbsp;</td>
                          </tr>
                     <tr>
                            <td align="center" ><table width="240" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper" >
                                <tr>
                                  <td align="center" bgcolor="#8c5cba" style="border-radius:46px;font-size:14px;line-height:20px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;padding:11px 0px;"  class="white12"><a href="%%=redirectto(@CTA_URL)=%%" target="_blank" style="font-size:14px;line-height:20px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;">%%=v(@CTA_copy)=%%</a></td>
                                </tr>
                              </table></td>
                          </tr>
                         
                    <tr>
                      <td height="45">&nbsp;</td>
                    </tr>
                  </table></td>
                <td width="45" class="aside_20">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
       
       
      
        <tr>
          <td  bgcolor="#f9f9f9" height="12" style="line-height:0px;font-size:0px;">&nbsp;</td>
        </tr>
         <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>%%[IF @Guest_Order == "False" THEN]%%

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#c06078">
                    <!--[if !mso 9]><!-->
                    
                    <tr>
                      <td align="center"  height="0" class="displaytd" style="display:none;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none;width:0;overflow:hidden;max-height:0px !important;background-color:#ffffff;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/61aa26d6-9a33-4202-8ffc-317fb73ba48d.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
                    </tr>
                    
                    <!--<![endif]-->
                    <tr>
                      <td class="mob_bg_pink"  valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr>
                            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr>
                                        <td width="35" class="aside_20">&nbsp;</td>
                                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td height="50" class="spc20">&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left" style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;" class="crabtree" ><a href="%%=REDIRECTTO(@Block_url_a)=%%" target="_blank" style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;">%%=v(@Block_1_a)=%% <span style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:normal;" class="crabtree">%%=v(@Block_2_a)=%%</span></a> <a href="%%=REDIRECTTO(@Block_url_a)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/arrow2" width="18" height="18" alt="" style="display:inline-block;max-width:18px;" border="0"  /></a></td>
                                            </tr>
                                            <tr>
                                              <td height="5" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="filled"><a href="%%=REDIRECTTO(@Block_url_a)=%%" target="_blank" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="filled">%%=v(@Block_a)=%%</a></td>
                                            </tr>
                                            <tr>
                                              <td height="22" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td  align="left" style="line-height:0px;font-size:0px;" height="3"><table width="37" border="0" cellspacing="0" cellpadding="0" align="left" height="3" style="line-height:0px;font-size:0px;">
                                                  <tr>
                                                    <td height="3" bgcolor="#ffffff" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                                 <tr>
                                  <td height="1"  class="spc_5"  style="line-height:0px;font-size:0px;">&nbsp;</td>
                                </tr>
                                
                              </table></td>
                            <td width="175" valign="top"  class="aside_20" style="padding-bottom:5px;"><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/b7254456-bf00-4c9c-b655-2a6d2074f478.jpg" width="175" height="182" class="hide" style="display:block;" border="0" /></td>
                          </tr>
                        </table></td>
  </tr>
 <tr>
                                  <td class="hide" bgcolor="#ffffff"><img
         src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/59e567ce-63d2-4931-9035-fe5ebdcbc569.jpg" width="600" height="124" style="display:block;" border="0" /></td>
                                </tr>
</table>
</td>
                    </tr>
                    <!--[if !mso 9]><!-->
                    
                    <tr>
                    <td align="center"  height="0" class="displaytd" style="display:none;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none;width:0;overflow:hidden;max-height:0px !important;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/4084c770-250e-43b4-b951-545ace2d0b86.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
                    </tr>
                   
                    <!--<![endif]-->
                     <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
              <tr>
                <td width="44" class="aside_20">&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
                          <tr>
                            <td width="48" align="left" valign="top" ><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/0307e504-bcfe-4eca-9b14-93db08961ff7.png" alt="" width="48" height="48"  style="display:block;max-width:48px;" border="0" /></td>
                            <td width="25">&nbsp;</td>
                            <td valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                  <td style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;"  align="left" class="create"><a href="%%=redirectto(@Block_sub_url)=%%" target="_blank" style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="create">%%=v(@Block_sub_copy1)=%% <span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:normal;" class="create">%%=v(@Block_sub_copy2)=%%</span> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/166dc463-9585-4a7c-8596-07b5be7061b1.jpg" width="6" height="8" style="display:inline-block;max-width:8px;" border="0" /></a></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="46">&nbsp;</td>
                    </tr>
                  </table></td>
                <td width="44" class="aside_20">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
                  </table>


%%[ELSE]%%


<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
          <td ><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#e17040">
              <!--[if !mso 9]><!-->
              
              <tr>
                <td align="center"  height="0" class="displaytd" style="display:none ;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none ;width:0;overflow:hidden;max-height:0px !important;background-color:#ffffff;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/bd793baa-d480-4dcf-9aa0-114a441951c9.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
              </tr>
              
              <!--<![endif]-->
              <tr>
                <td   class="mob_bg2" bgcolor="#e17040"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                      <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="35" class="aside_20">&nbsp;</td>
                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr>
                                        <td height="50"  class="spc20" >&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td align="left" style="font-size:30px;line-height:31px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;" class="become" ><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:30px;line-height:31px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;" class="become">%%=v(@Block_title_1)=%% </a><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank"  style="font-size:30px;line-height:31px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:normal;" class="become">%%=v(@Block_title_2)=%%</a> <a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/arrow2" width="18" height="18" alt="" style="display:inline-block;max-width:18px;" border="0"  /></a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td align="left" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="account"><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="account">%%=v(@Block_copy)=%%</a></td>
                                      </tr>
                                      <tr>
                                        <td height="18" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td  align="left" style="line-height:0px;font-size:0px;" height="3"><table width="37" border="0" cellspacing="0" cellpadding="0" align="left" height="3" style="line-height:0px;font-size:0px;">
                                            <tr>
                                              <td height="3" bgcolor="#ffffff" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr>
                                                                <td height="1" style="line-height:0px;font-size:0px;" class="spc_5" >&nbsp;</td>
                                                              </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                          
                        </table></td>
                      <td width="175" class="aside_20" valign="top" style="padding-bottom:5px;"><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/46fec4ff-a653-4c10-a52c-9c540a697bec.jpg" alt="" width="175" height="220" class="hide" style="display:block;max-width:175px;" border="0" /></td>
                    </tr>
                  </table></td>
  </tr>
    <tr>
                            <td class="hide" bgcolor="#ffffff"><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/546994b9-c781-4c55-a250-d63d40c1afe8.jpg" alt="" width="600" height="99" style="display:block;" border="0" /></td>
                          </tr>
</table>
</td>
              </tr>
              <!--[if !mso 9]><!-->
              
              <tr>
                <td align="center"  height="0" class="displaytd" style="display:none ;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none ;width:0;overflow:hidden;max-height:0px !important;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/3189d6b2-80e2-457a-86a2-407f5cac85f7.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
              </tr>
              
              <!--<![endif]-->
                <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
              <tr>
                <td width="44" class="aside_20">&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
                          <tr>
                            <td width="48" align="left" valign="top" ><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/0307e504-bcfe-4eca-9b14-93db08961ff7.png" alt="" width="48" height="48"  style="display:block;max-width:48px;" border="0" /></td>
                            <td width="25">&nbsp;</td>
                            <td valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                  <td style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;"  align="left" class="create"><a href="%%=redirectto(@Block_sub_url)=%%" target="_blank" style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="create">%%=v(@Block_sub_copy1)=%% <span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:normal;" class="create">%%=v(@Block_sub_copy2)=%%</span> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/166dc463-9585-4a7c-8596-07b5be7061b1.jpg" width="6" height="8" style="display:inline-block;max-width:8px;" border="0" /></a></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="46">&nbsp;</td>
                    </tr>
                  </table></td>
                <td width="44" class="aside_20">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
            </table></td>
        </tr>
      
</table>



%%[ENDIF]%%</td>
              </tr>
             
            </table></td>
        </tr>
      
        <tr>
          <td  bgcolor="#f9f9f9" height="12" style="line-height:0px;font-size:0px;">&nbsp;</td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#bae1d3" style="overflow:hidden;">
                    <tr>
                      <td width="40" class="aside">&nbsp;</td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td style="padding:30px 0px 0px 0px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                  <td><table width="250" border="0" cellspacing="0" cellpadding="0" align="right" class="wrapper">
                                      <tr>
                                        <td valign="top" class="bo_bottom" style="padding-bottom:90px;" ><table width="250" border="0" cellspacing="0" cellpadding="0" align="center" class="wrap_375" >
                                            <tr>
                                              <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Instagram_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/instagram1" alt="insta" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
                                              <td width="17">&nbsp;</td>
                                              <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Facebook_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/facebook1" alt="fb" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
                                              <td width="17">&nbsp;</td>
                                              <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Twitter_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/twitter1" alt="tw" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
                                              <td width="17">&nbsp;</td>
                                              <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Youtube_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/youtube1" alt="yt" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
                                              <td width="18">&nbsp;</td>
                                              <td width="36" class="icon" align="left"><a href="%%=REDIRECTTO(@Pintrest_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/pinterest1" alt="pint" width="36" height="36" style="display:block;max-width:36px;"  border="0"  class="icon" /></a></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr>
                                        <td  align="left" valign="top" 
                                                    class="manage" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-bottom:20px;"><a href="%%=REDIRECTTO(@Preference_url)=%%" target="_blank" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;" ></a></td>
                                      </tr>
                                    </table>
                                    <table width="220" border="0" cellspacing="0" cellpadding="0" align="left" class="wrapper">
                                      <tr>
                                        <td align="left" valign="top" class="crab" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" height="105">%%=v(@Postal_address)=%% </td>
                                      </tr>
                                      <tr>
                                        <td align="left" valign="top" class="copy12" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;"><a href="tel:%%=v(@phone_number)=%%" target="_blank" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;">%%=v(@phone_number)=%%</a><br />
                                          <a href="mailto:%%=v(@Footer_Email)=%%" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;"> %%=v(@Footer_Email)=%%</a></td>
                                      </tr>
                                      <tr>
                                        <td height="20" style="line-height:0px;font-size:0px;" class="spc_25">&nbsp;</td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                      <td width="40" class="aside">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#bae1d3" style="overflow:hidden;">
                    <tr>
                      <td width="10" class="aside">&nbsp;</td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="5" style="line-height:0px;font-size:0px;" class="hide">&nbsp;</td>
                          </tr>
                          <tr>
                            <td bgcolor="#53c397" style="line-height:0px;font-size:0px;" height="1"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer2" width="1" height="1" style="display:block;" border="0" /></td>
                          </tr>
                          <tr>
                            <td height="10" style="line-height:0px;font-size:0px;" class="spc_30">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center"><a href="%%=RedirectTo(@Logo_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/tree" width="37" alt="Crabtree and Evelyn" height="36" style="display:block;max-width:37px;"  border="0" /></a></td>
                          </tr>
                          <tr>
                            <td height="10" style="line-height:0px;font-size:0px;">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center" style="font-size:12px;line-height:14px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" class="copy">%%=v(@Copyright)=%%</td>
                          </tr>
                          <tr>
                            <td height="15" style="line-height:0px;font-size:0px;" class="spc_30">&nbsp;</td>
                          </tr>
                        </table></td>
                      <td width="10" class="aside">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="7" style="line-height:0px;font-size:0px;" bgcolor="#53c397"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer2" width="1" height="1" style="display:block;" border="0" /></td>
              </tr>
              <tr>
                <td align="left" style="padding:15px 0px 10px 0px;font-size:10px;line-height:14px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#797979;" class="footer">%%=TreatAsContent(@Footer_text_1_body)=%%<br />
                  <br />
                  %%=TreatAsContent(@Footer_text_2_body)=%% </td>
              </tr>
              <tr>
                <td height="20" >&nbsp;</td>
              </tr>
              <tr>
                <td style="line-height:1px; font-size:1px;" class="hide"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer" height="1"  width="600" style="max-height:1px; min-height:1px; display:block; width:600px; min-width:600px;" border="0" /></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td style="line-height:1px; font-size:1px;" class="hide"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer" height="1"  width="600" style="max-height:1px; min-height:1px; display:block; width:600px; min-width:600px;" border="0" /></td>
        </tr>
      </table></td>
  </tr>
 </table>
<div style="display:none !important; white-space:nowrap; font:20px courier; color:#ffffff;">- - - - - - - - - - - - - - - - - - - - - -</div>
</body>
</html>
*/

    /* <------------------------Newsletter signup confirmation--------------------------------------->*/
    /*
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>%%=v(@Subjectline)=%%</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0 " />
<meta name="format-detection" content="telephone=no">
<!--[if !mso]><!-->
<link href='https://fonts.googleapis.com/css?family=Work+Sans' rel='stylesheet' type='text/css'>
<!--<![endif]-->
%%[   
VAR @BU
VAR @Inspire_copy
VAR @Discover_copy
VAR @Connect_copy
VAR @Inspire_url
VAR @Discover_url
VAR @Connect_url
VAR @From_name
VAR @Subjectline
VAR @Preview_Text
VAR @Header_0
VAR @Header_2
VAR @Logo_url
VAR @Instagram_link
VAR @Facebook_link
VAR @Twitter_link
VAR @Youtube_link
VAR @Pintrest_link
VAR @Footer_Email
VAR @phone_number
VAR @Postal_address
VAR @Preference_copy
VAR @Copyright
VAR @Footer_text_1_body
VAR @Footer_text_2_body
VAR @Preference_url
VAR @Privacy_policy_copy
VAR @Privacy_policy_url
VAR @Terms_and_conditions_copy
VAR @Terms_and_conditions_url
VAR @FirstName
VAR @FirstLetter
VAR @Hero_text_1 
VAR @Hero_text_2 
VAR @Salutation_copy_1
VAR @Body_1
VAR @CTA_copy
VAR @CTA_URL
VAR @Reason_for_email


VAR @Header_1_url
VAR @Hero_url
VAR @Preference_centre_copy 
VAR @Preference_centre_url
VAR @Block_title_1
VAR @Block_title_2 
VAR @Block_title_url 
VAR @Block_copy 
VAR @Block_sub_copy_1_1
VAR @Block_sub_copy_1_2
VAR @Block_sub_copy_2_1
VAR @Block_sub_copy_2_2
 VAR @Header_1
 VAR @Header_3

SET @BU = Language
 
IF @BU == "en_GB" OR @BU == "en_AU" OR @BU == "en_US" OR @BU == "en_CA" OR @BU == "fr_CA" OR @BU == "en_SG" OR @BU == "es_MX" OR @BU == "en_MX" OR @BU == "en_MY" OR @BU == "zn_HK" OR @BU == "en_HK" OR @BU == "de_DE" OR @BU == "en_DE" OR @BU == "fr_FR" OR @BU == "en_FR" OR @BU == "zn_SG"
THEN SET @BU = Language
ELSE SET @BU = "en_GB"
ENDIF  

SET @Inspire_copy = Lookup("Newsletter_Signup_UK_Confirmation","Inspire_copy","BU",@BU)
SET @Discover_copy = Lookup("Newsletter_Signup_UK_Confirmation","Discover_copy","BU",@BU)
SET @Connect_copy = Lookup("Newsletter_Signup_UK_Confirmation","Connect_copy","BU",@BU)
SET @Inspire_url = Lookup("Newsletter_Signup_UK_Confirmation","Inspire_url","BU",@BU)
SET @Discover_url = Lookup("Newsletter_Signup_UK_Confirmation","Discover_url","BU",@BU)
SET @Connect_url = Lookup("Newsletter_Signup_UK_Confirmation","Connect_url","BU",@BU) 
SET @From_name = Lookup("Newsletter_Signup_UK_Confirmation","From_name","BU",@BU)
SET @Subjectline = Lookup("Newsletter_Signup_UK_Confirmation","Subjectline","BU",@BU)
SET @Preview_Text = Lookup("Newsletter_Signup_UK_Confirmation","Preview_Text","BU",@BU)
SET @Header_0 = Lookup("Newsletter_Signup_UK_Confirmation","Header_0","BU",@BU)
SET @Header_2 = Lookup("Newsletter_Signup_UK_Confirmation","Header_2","BU",@BU)
SET @Logo_url = Lookup("Newsletter_Signup_UK_Confirmation","Logo_url","BU",@BU)
SET @Instagram_link = Lookup("Newsletter_Signup_UK_Confirmation","Instagram_link","BU",@BU)
SET @Facebook_link = Lookup("Newsletter_Signup_UK_Confirmation","Facebook_link","BU",@BU)
SET @Twitter_link = Lookup("Newsletter_Signup_UK_Confirmation","Twitter_link","BU",@BU)
SET @Youtube_link = Lookup("Newsletter_Signup_UK_Confirmation","Youtube_link","BU",@BU)
SET @Pintrest_link = Lookup("Newsletter_Signup_UK_Confirmation","Pintrest_link","BU",@BU)
SET @Footer_Email = Lookup("Newsletter_Signup_UK_Confirmation","Footer_Email","BU",@BU)
SET @phone_number = Lookup("Newsletter_Signup_UK_Confirmation","phone_number","BU",@BU)
SET @Postal_address = Lookup("Newsletter_Signup_UK_Confirmation","Postal_address","BU",@BU)
SET @Preference_copy = Lookup("Newsletter_Signup_UK_Confirmation","Preference_copy","BU",@BU)
SET @Copyright = Lookup("Newsletter_Signup_UK_Confirmation","Copyright","BU",@BU)
SET @Footer_text_1_body = Lookup("Newsletter_Signup_UK_Confirmation","Footer_text_1_body","BU",@BU)
SET @Footer_text_2_body = Lookup("Newsletter_Signup_UK_Confirmation","Footer_text_2_body","BU",@BU)
SET @Preference_url = Lookup("Newsletter_Signup_UK_Confirmation","Preference_url","BU",@BU)
SET @Privacy_policy_copy = Lookup("Newsletter_Signup_UK_Confirmation","Privacy_policy_copy","BU",@BU)
SET @Privacy_policy_url = Lookup("Newsletter_Signup_UK_Confirmation","Privacy_policy_url","BU",@BU)
SET @Terms_and_conditions_copy = Lookup("Newsletter_Signup_UK_Confirmation","Terms_and_conditions_copy","BU",@BU)
SET @Terms_and_conditions_url = Lookup("Newsletter_Signup_UK_Confirmation","Terms_and_conditions_url","BU",@BU)
SET @FirstName = FirstName
SET @FirstLetter = Substring (@FirstName,1,1)
SET @Hero_text_1 = Lookup("Newsletter_Signup_UK_Confirmation","Hero_text_1","BU",@BU) 
SET @Hero_text_2 = Lookup("Newsletter_Signup_UK_Confirmation","Hero_text_2","BU",@BU)
SET @Salutation_copy_1 = Lookup("Newsletter_Signup_UK_Confirmation","Salutation_copy_1","BU",@BU)
SET @Body_1 = Lookup("Newsletter_Signup_UK_Confirmation","Body_1","BU",@BU)
SET @CTA_copy = Lookup("Newsletter_Signup_UK_Confirmation","CTA_copy","BU",@BU)
SET @CTA_URL = Lookup("Newsletter_Signup_UK_Confirmation","CTA_URL","BU",@BU)
SET @Reason_for_email = Lookup("Newsletter_Signup_UK_Confirmation","Reason_for_email","BU",@BU)


SET @Header_1_url = Lookup("Newsletter_Signup_UK_Confirmation","Header_1_url","BU",@BU)
SET @Hero_url = Lookup("Newsletter_Signup_UK_Confirmation","Hero_url","BU",@BU)
SET @Preference_centre_copy = Lookup("Newsletter_Signup_UK_Confirmation","Preference_centre_copy","BU",@BU) SET @Preference_centre_url = Lookup("Newsletter_Signup_UK_Confirmation","Preference_centre_url","BU",@BU)
SET @Block_title_1 = Lookup("Newsletter_Signup_UK_Confirmation","Block_title_1","BU",@BU) SET @Block_title_2 = Lookup("Newsletter_Signup_UK_Confirmation","Block_title_2","BU",@BU) SET @Block_title_url = Lookup("Newsletter_Signup_UK_Confirmation","Block_title_url","BU",@BU) SET @Block_copy = Lookup("Newsletter_Signup_UK_Confirmation","Block_copy","BU",@BU) 
SET @Block_sub_copy_1_1 = Lookup("Newsletter_Signup_UK_Confirmation","Block_sub_copy_1_1","BU",@BU)
 SET @Block_sub_copy_1_2 = Lookup("Newsletter_Signup_UK_Confirmation","Block_sub_copy_1_2","BU",@BU) 
 SET @Block_sub_copy_2_1 = Lookup("Newsletter_Signup_UK_Confirmation","Block_sub_copy_2_1","BU",@BU)
 SET @Block_sub_copy_2_2 = Lookup("Newsletter_Signup_UK_Confirmation","Block_sub_copy_2_2","BU",@BU) 
 SET @Header_1 = Lookup("Newsletter_Signup_UK_Confirmation","Header_1","BU",@BU)
SET @Header_3 = Lookup("Newsletter_Signup_UK_Confirmation","Header_3","BU",@BU) 

]%%
<style type="text/css">
body {
 margin: 0 !important;
 padding: 0 !important;
 -webkit-text-size-adjust: 100% !important;
 -ms-text-size-adjust: 100% !important;
 -webkit-font-smoothing: antialiased !important;
}
img {
 border: 0 !important;
 outline: none !important;
}
p {
 margin: 0px !important;
 padding: 0px !important;
}
table {
 border-collapse: collapse;
 mso-table-lspace: 0px;
 mso-table-rspace: 0px;
}
td, a, span {
 border-collapse: collapse;
 mso-line-height-rule: exactly;
}
.ExternalClass * {
 line-height: 100%;
}
div, button {
 display: block !important;
 padding: 0 !important;
 margin: 0 !important;
}
.ins a {
 color: #333333 !important;
 text-decoration: none;
}
.footer a {
 color: #797979 !important;
 text-decoration: none;
}
.copy a {
 color: #333333 !important;
 text-decoration: none;
}
.jac a {
 color: #333333 !important;
 text-decoration: none;
}
.las a {
 color: #333333 !important;
 text-decoration: none;
}
.lasp a {
 color: #333333 !important;
 text-decoration: none;
}
.copy12 a {
 color: #333333 !important;
 text-decoration: none;
}
.copy001 a {
 color: #333333 !important;
 text-decoration: none;
}
.homemade a {
 color: #333333 !important;
 text-decoration: none;
}
.create a {
 color: #333333 !important;
 text-decoration: none;
}
.crab a {
 color: #333333 !important;
 text-decoration: none !important;
}
.manage a {
 color: #333333 !important;
 text-decoration: none;
}
.pls a {
 color: #666666 !important;
 text-decoration: none;
}
.pound a {
 color: #666666 !important;
 text-decoration: none;
}
.use a {
 color: #333333 !important;
 text-decoration: underline !important;
 font-weight:bold !important;
}
.filled a {
 color: #ffffff !important;
 text-decoration: none;
}
.crabtree a {
 color: #ffffff !important;
 text-decoration: none;
}
.white12 a {
 color: #ffffff !important;
 text-decoration: none;
}
 @media only screen and (min-width:481px) and (max-width:599px) {
.wrapper {
 width: 100% !important;
}
.aside {
 width: 15px !important;
}
.hide {
 display: none !important;
}
.full_img {
 width: 100% !important;
 height: auto !important;
 max-width: 100% !important;
}
.pls {
 display: none !important;
}
.footer {
 padding: 15px 10px !important;
}
.spc_10 {
 height: 10px !important;
}
.ins {
 font-size: 14px !important;
 line-height: 20px !important;
}
.jac {
 font-size: 16px !important;
 line-height: 28px !important;
}
.las {
 font-size: 18px !important;
 line-height: 24px !important;
}
.lasp {
 font-size: 24px !important;
 line-height: 30px !important;
 padding: 10px 0px 0px 0px !important;
}
.pound {
 font-size: 24px !important;
 line-height: 30px !important;
}
.use, .use a {
 font-size: 14px !important;
 line-height: 24px !important;
}
.spc_25 {
 height: 25px !important;
}
.spc_15 {
 height: 15px !important;
}
.spc_36 {
 height: 36px !important;
}
.homemade {
 font-size: 22px !important;
 line-height: 30px !important;
}
.copy12 , .copy12 a  {
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
 height: auto !important;
}
.crab {
 padding: 0px 30px 20px 30px !important;
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
 height:auto !important;
}
.manage {
 text-align: center !important;
 padding: 25px 0px !important;
}
.icon {
 width: 42px !important;
 height: auto !important;
 max-width: 42px !important;
}
.bo_bottom {
 border-bottom: #53c397 2px solid !important;
 padding-bottom: 30px !important;
}
.spc_30 {
 height: 30px !important;
}
.wrap_375 {
 width: 375px !important;
}
td .display_mobile {
 display: block !important;
 height: auto !important;
}
div .display_mobile {
 display: table !important;
 float: none !important;
 width: 100% !important;
 overflow: visible !important;
 height: auto !important;
}
.aside_20 {
 width: 20px !important;
}
.mob_bg {
 background-image: none !important;
 background-color: #c06078 !important;
}
.spc_60 {
 height: 100px !important;
}
.crabtree, .crabtree a {
 font-size: 30px !important;
 line-height: 31px !important;
}
.filled, .filled a {
 font-size: 16px !important;
 padding-top: 10px !important;
 line-height: 24px !important;
}
.create {
 font-size: 16px !important;
 line-height: 24px !important;
}
.spc20
{
 height:20px !important;
}
.spc_5
{
 height:5px !important;
}
}
 @media only screen and (max-width:480px) {

.spc_5
{
 height:5px !important;
}  
.wrapper {
 width: 100% !important;
}
.aside {
 width: 15px !important;
}
.hide {
 display: none !important;
}
.full_img {
 width: 100% !important;
 height: auto !important;
 max-width: 100% !important;
}
.pls {
 display: none !important;
}
.footer {
 padding: 15px 10px !important;
}
.spc_10 {
 height: 10px !important;
}
.spc_36 {
 height: 36px !important;
}
.ins {
 font-size: 14px !important;
 line-height: 20px !important;
}
.use, .use a {
 font-size: 14px !important;
 line-height: 24px !important;
}
.lasp {
 font-size: 24px !important;
 line-height: 30px !important;
 padding: 10px 0px 0px 0px !important;
}
.jac {
 font-size: 16px !important;
 line-height: 28px !important;
}
.las {
 font-size: 18px !important;
 line-height: 24px !important;
}
.pound {
 font-size: 24px !important;
 line-height: 30px !important;
}
.spc_25 {
 height: 25px !important;
}
.spc_15 {
 height: 15px !important;
}
.homemade {
 font-size: 22px !important;
 line-height: 30px !important;
}
.copy12 , .copy12 a  {
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
 height: auto !important;
}
.crab {
 padding: 0px 30px 20px 30px !important;
 text-align: center !important;
 font-size: 14px !important;
 line-height: 24px !important;
 height:auto !important;
}
.manage {
 text-align: center !important;
 padding: 25px 0px !important;
}
.icon {
 width: 42px !important;
 height: auto !important;
 max-width: 42px !important;
}
.bo_bottom {
 border-bottom: #53c397 2px solid !important;
 padding-bottom: 30px !important;
}
.spc_30 {
 height: 30px !important;
}
.wrap_375 {
 width: 100% !important;
}
.displaytd {
 display: block !important;
 height: auto !important;
}
.displaydiv {
 display: table !important;
 float: none !important;
 width: 100% !important;
 overflow: visible !important;
 height: auto !important;
}
.aside_20 {
 width: 20px !important;
}
.mob_bg {
 background-image: none !important;
 background-color: #c06078 !important;
}
.spc_60 {
 height: 60px !important;
}
.crabtree, .crabtree a {
 font-size: 30px !important;
 line-height: 31px !important;
}
.filled, .filled a {
 font-size: 16px !important;
 padding-top: 10px !important;
 line-height: 24px !important;
}
 {
 font-size: 16px !important;
 padding-top: 10px !important;
 line-height: 24px !important;
}
.create {
 font-size: 16px !important;
 line-height: 24px !important;
}
.spc20
{
 height:20px !important;
}
}
</style>

<!--[if !mso]><!-->
<style>
.out{ background-color:#d64000;
}
</style>
<!--<![endif]-->

</head><body style="margin:0px; padding:0px;" bgcolor="#f9f9f9">
<custom name="opencounter" type="tracking">
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f9" style="background-color:#f9f9f9;">
  <tr>
    <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="wrapper">
                    <tr>
                      <td height="40" class="hide">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="left" valign="top" class="pls" style="padding:0px 0px 5px 0px;font-size:10px;line-height:12px; text-decoration:none;font-family:'Work Sans',Arial, Helvetica, sans-serif; color:#666666;">%%=TreatAsContent(@Header_0)=%% </td>
                    </tr>
                    <tr>
                      <td height="10" style="line-height:0px;font-size:0px;" class="spc_10">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#bbe2d4" style="background-color:#bbe2d4;">
                    <tr>
                      <td width="20">&nbsp;</td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr>
                            <td height="30">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center"><a href="%%=RedirectTo(@Logo_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/logo11" width="249" height="32" style="display:block;max-width:249px;" alt="CRABTREE AND EVELYN LONDON" border="0" /></a></td>
                          </tr>
                          <tr>
                            <td align="center"><table width="280" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                  <td width="86" align="center" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;" class="ins"><a href="%%=RedirectTo(@Inspire_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-right:15px;"  class="ins">%%=v(@Inspire_copy)=%%</a></td>
                                  <td width="2" style="color:#53c397;font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif;" align="center">|</td>
                                  <td  align="center" width="110" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;"><a href="%%=RedirectTo(@Discover_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-right:15px;padding-left:15px;"  class="ins">  %%=v(@Discover_copy)=%%  </a></td>
                                  <td width="2" style="color:#53c397;font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif;" align="center">|</td>
                                  <td style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding:25px 0px;" align="right" width="77"><a href="%%=RedirectTo(@Connect_url)=%%" target="_blank" style="font-size:15px;line-height:17px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-left:15px;"  class="ins"> %%=v(@Connect_copy)=%%</a></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                      <td width="20">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td><a href="%%=RedirectTo(@Hero_url)=%%" target="_blank"><img src="http://media.crabtree-evelyn.com/i/crabtree_evelyn/hero_banner" alt="" width="600"  class="full_img" style="display:block;max-width:600px;" border="0"  /></a></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td ><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" >
                    <tr>
                      <td width="40" class="aside_20">&nbsp;</td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="54">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center" style="font-size:30px;line-height:42px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" class="copy"><span style="font-size:30px;line-height:42px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;">%%=v(@Hero_text_1)=%% </span> %%=v(@Hero_text_2)=%%</td>
                          </tr>
                          <tr>
                            <td height="10" style="line-height:0px;font-size:0px;">&nbsp;</td>
                          </tr>
                          <tr>
                            <td  align="center" style="line-height:0px;font-size:0px;" height="3"><table width="36" border="0" cellspacing="0" cellpadding="0" align="center" height="3" style="line-height:0px;font-size:0px;">
                                <tr>
                                  <td height="3" bgcolor="#333333" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="36" class="spc_30">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center"><table width="400" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
                                <tr>
                                  <td style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" align="center" class="jac">%%=v(@Salutation_copy_1)=%% <span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="jac">%%=propercase(@FirstName)=%%,</span><br />
                                    <br />
                                    %%=v(@Body_1)=%% </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="36" >&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center" ><table width="177" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper" >
                                <tr>
                                  <td align="center" bgcolor="#8c5cba" style="border-radius:46px;font-size:14px;line-height:20px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;padding:11px 0px;"  class="white12"><a href="%%=REDIRECTTO(@CTA_URL)=%%" target="_blank" style="font-size:14px;line-height:20px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;">%%=v(@CTA_copy)=%%</a></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="36">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="1" style="line-height:0px;font-size:0px;" bgcolor="#d9d9d9" ><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer2" width="1" height="1" style="display:block;" border="0" /></td>
                          </tr>
                          <tr>
                            <td height="36" >&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center"><table width="400" border="0" cellspacing="0" cellpadding="0" align="center" class="wrapper">
                                <tr>
                                  <td style="font-size:12px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" align="center" class="use">%%=v(@Reason_for_email)=%% </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="54" >&nbsp;</td>
                          </tr>
                        </table></td>
                      <td width="40" class="aside_20">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td  bgcolor="#f9f9f9" height="12" style="line-height:0px;font-size:0px;">&nbsp;</td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td ><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#c06078">
                    <!--[if !mso 9]><!-->
                    
                    <tr>
                      <td align="center"  height="0" class="displaytd" style="display:none ;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none ;width:0;overflow:hidden;max-height:0px !important;background-color:#ffffff;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/61aa26d6-9a33-4202-8ffc-317fb73ba48d.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
                    </tr>
                    
                    <!--<![endif]-->
                    <tr>
                      <td class="mob_bg"  valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr>
                            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr>
                                        <td width="35" class="aside_20">&nbsp;</td>
                                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td height="50" class="spc20">&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left" style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;" class="crabtree" ><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:bold;" class="crabtree">%%=v(@Block_title_1)=%% <span style="font-size:30px;line-height:35px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;font-weight:normal;" class="crabtree">%%=v(@Block_title_2)=%%</span></a> <a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/arrow2" width="18" height="18" alt="" style="display:inline-block;max-width:18px;" border="0"  /></a></td>
                                            </tr>
                                            <tr>
                                              <td height="5" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="filled"><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:14px;line-height:18px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#ffffff;" class="filled">%%=v(@Block_copy)=%%</a></td>
                                            </tr>
                                            <tr>
                                              <td height="22" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td  align="left" style="line-height:0px;font-size:0px;" height="3"><table width="37" border="0" cellspacing="0" cellpadding="0" align="left" height="3" style="line-height:0px;font-size:0px;">
                                                  <tr>
                                                    <td height="3" bgcolor="#ffffff" style="line-height:0px;font-size:0px;">&nbsp;</td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                            <tr>
                                              <td height="1" class="spc_5" style="line-height:0px;font-size:0px;" >&nbsp;</td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                               
                            </table></td>
                            <td width="175" valign="top"  class="aside_20" style="padding-bottom:5px;"><img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/b7254456-bf00-4c9c-b655-2a6d2074f478.jpg" width="175" height="182" class="hide" style="display:block;" border="0" /></td>
                          </tr>
                        </table></td>
  </tr>
   <tr>
                                  <td class="hide"><img
         src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/59e567ce-63d2-4931-9035-fe5ebdcbc569.jpg" width="600" height="124" style="display:block;" border="0" /></td>
                          </tr>
</table>
</td>
                    </tr>
                    <!--[if !mso 9]><!-->
                    
                    <tr>
                      <td align="center"  height="0" class="displaytd" style="display:none ;" bgcolor="#ffffff"  ><div class="displaydiv"    style="display:none ;width:0;overflow:hidden;max-height:0px !important;"> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/4084c770-250e-43b4-b951-545ace2d0b86.png" alt="" width="100%"   style="display:block;max-width:100%;" border="0"  /> </div></td>
                    </tr>
                    
                    <!--<![endif]-->
                    
                  </table></td>
              </tr>
              <tr>
 <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
<tr><td width="44" class="aside_20">&nbsp;</td><td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="30">&nbsp;</td></tr><tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
<tr><td width="48" align="left" valign="top" ><img src="http://media.crabtree-evelyn.com/i/crabtree_evelyn/icon2" alt="" width="45"  style="display:block;max-width:48px;" border="0" /></td><td width="25">&nbsp;</td><td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"><tr>
<td style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;"  align="left" class="create"><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="create">%%=v(@Block_sub_copy_2_1)=%%&nbsp;<span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:normal;" class="create">%%=v(@Block_sub_copy_2_2)=%%</span> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/166dc463-9585-4a7c-8596-07b5be7061b1.jpg" width="6" height="8" style="display:inline-block;max-width:8px;" border="0" /></a></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="36">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="1" style="line-height:0px;font-size:0px;" bgcolor="#d9d9d9"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer2" width="1" height="1" style="display:block;" border="0" /></td>
                          </tr>
                          <tr>
                            <td height="36">&nbsp;</td>
                          </tr>
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
                                <tr>
                                  <td width="48" align="left" valign="top" ><img src="http://media.crabtree-evelyn.com/i/crabtree_evelyn/icon11" alt="" width="43"  style="display:block;max-width:48px;" border="0" /></td>
                                  <td width="25">&nbsp;</td>
                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr>
<td  align="left" valign="top" class="create" style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;"><a href="%%=REDIRECTTO(@Block_title_url)=%%" target="_blank" style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:bold;" class="create">%%=v(@Block_sub_copy_1_1)=%%&nbsp;<span style="font-size:14px;line-height:24px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;font-weight:normal;" class="create">%%=v(@Block_sub_copy_1_2)=%%</span> <img src="http://image.email.crabtree-evelyn.com/lib/fe5a15707c6202747314/m/1/166dc463-9585-4a7c-8596-07b5be7061b1.jpg" width="6" height="8" style="display:inline-block;max-width:8px;" border="0" /></a></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="54" class="spc_36" >&nbsp;</td>
                          </tr>
                        </table></td>
                      <td width="44" class="aside_20">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td  bgcolor="#f9f9f9" height="12" style="line-height:0px;font-size:0px;">&nbsp;</td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#bae1d3" style="overflow:hidden;">
              <tr>
                <td width="40" class="aside">&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding:30px 0px 0px 0px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr>
                            <td><table width="250" border="0" cellspacing="0" cellpadding="0" align="right" class="wrapper">
                                <tr>
                                  <td valign="top" class="bo_bottom" style="padding-bottom:60px;" ><table width="250" border="0" cellspacing="0" cellpadding="0" align="center" class="wrap_375" >
                                      <tr>
                                        <td width="36" class="icon" align="center"><a href="%%=REDIRECTTO(@Instagram_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/instagram1" alt="insta" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
                                        <td width="17">&nbsp;</td>
                                        <td width="36" class="icon" align="center"><a href="%%=REDIRECTTO(@Facebook_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/facebook1" alt="fb" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
                                        <td width="17">&nbsp;</td>
                                        <td width="36" class="icon" align="center"><a href="%%=REDIRECTTO(@Twitter_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/twitter1" alt="tw" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
                                        <td width="17">&nbsp;</td>
                                        <td width="36" class="icon" align="center"><a href="%%=REDIRECTTO(@Youtube_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/youtube1" alt="yt" width="36" height="36" style="display:block;max-width:36px;"  border="0" class="icon" /></a></td>
                                        <td width="18">&nbsp;</td>
                                        <td width="36" class="icon" align="center"><a href="%%=REDIRECTTO(@Pintrest_link)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/pinterest1" alt="pint" width="36" height="36" style="display:block;max-width:36px;"  border="0"  class="icon" /></a></td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                  <td  align="left" valign="top" 
                                                    class="manage" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;padding-bottom:20px;"><a href="%%=REDIRECTTO(@Preference_url)=%%" target="_blank" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;"   class="manage">%%=v(@Preference_copy)=%%</a></td>
                                </tr>
                              </table>
                              <table width="220" border="0" cellspacing="0" cellpadding="0" align="left" class="wrapper">
                                <tr>
                                  <td align="left" valign="top" class="crab" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" height="75">%%=v(@Postal_address)=%% </td>
                                </tr>
                                <tr>
                                  <td align="left" valign="top" class="copy12" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;"><a href="tel:%%=v(@phone_number)=%%" target="_blank" style="font-size:12px;line-height:21px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" class="copy12" >%%=v(@phone_number)=%%</a><br />
                                    <a href="mailto:%%=v(@Footer_Email)=%%" style="font-size:12px;line-height:21px; text-decoration:underline;font-family:Arial, Helvetica, sans-serif; color:#333333;" class="copy12" > %%=v(@Footer_Email)=%%</a></td>
                                </tr>
                                <tr>
                                  <td height="20" style="line-height:0px;font-size:0px;" class="spc_25">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
                <td width="40" class="aside">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#bae1d3" style="overflow:hidden;">
              <tr>
                <td width="10" class="aside">&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="5" style="line-height:0px;font-size:0px;" class="hide">&nbsp;</td>
                    </tr>
                    <tr>
                      <td bgcolor="#53c397" style="line-height:0px;font-size:0px;" height="1"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer2" width="1" height="1" style="display:block;" border="0" /></td>
                    </tr>
                    <tr>
                      <td height="10" style="line-height:0px;font-size:0px;" class="spc_30">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="center"><a href="%%=RedirectTo(@Logo_url)=%%" target="_blank"><img src="http://i1.adis.ws/i/crabtree_evelyn/tree" width="37" alt="Crabtree and Evelyn" height="36" style="display:block;max-width:37px;"  border="0" /></a></td>
                    </tr>
                    <tr>
                      <td height="10" style="line-height:0px;font-size:0px;">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="center" style="font-size:12px;line-height:14px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#333333;" class="copy">%%=v(@Copyright)=%%</td>
                    </tr>
                    <tr>
                      <td height="15" style="line-height:0px;font-size:0px;" class="spc_30">&nbsp;</td>
                    </tr>
                  </table></td>
                <td width="10" class="aside">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="7" style="line-height:0px;font-size:0px;" bgcolor="#53c397"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer2" width="1" height="1" style="display:block;" border="0" /></td>
        </tr>
        <tr>
          <td align="left" style="padding:15px 0px 10px 0px;font-size:10px;line-height:14px; text-decoration:none;font-family:Arial, Helvetica, sans-serif; color:#797979;" class="footer">%%=TreatAsContent(@Footer_text_1_body)=%%<br />
            <br />
            %%=TreatAsContent(@Footer_text_2_body)=%% </td>
        </tr>
        <tr>
          <td height="20" >&nbsp;</td>
        </tr>
        <tr>
          <td style="line-height:1px; font-size:1px;" class="hide"><img src="http://i1.adis.ws/i/crabtree_evelyn/spacer" height="1"  width="600" style="max-height:1px; min-height:1px; display:block; width:600px; min-width:600px;" border="0" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<div style="display:none !important; white-space:nowrap; font:20px courier; color:#ffffff;">- - - - - - - - - - - - - - - - - - - - - -</div>
</body>
</html>
*/
}