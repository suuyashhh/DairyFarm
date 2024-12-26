<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="WebApplication1.Doctor" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doctor Management</title>

    <!-- Vendor CSS Files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-icons/bootstrap-icons.css" />
    <link href="https://fonts.googleapis.com/css2?family=Saira:wght@400;500;600&display=swap" rel="stylesheet" />


    <!-- Sweet Alert -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />


    <!-- Custom CSS -->
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: "Saira", sans-serif;
        }

        /* Header styles */
        .header {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 10px 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #ddd;
            position: fixed; 
            top: 0; 
            left: 0;
            right: 0;
            z-index: 1000; 
        }

            .header img {
                height: 50px;
                margin-right: 10px;
            }

            .header h1 {
                font-size: 24px;
                margin: 0;
                color: #495057;
            }

        .content {
            padding: 100px 20px 20px; 
        }

        
        .form-group {
            position: relative;
            margin-bottom: 15px;
        }

        .form-label {
            position: absolute;
            top: -8px;
            left: 15px;
            background: white;
            padding: 0 5px;
            font-size: 0.9rem;
            color: #495057;
        }

        .form-control {
            appearance: none;
            background-color: #fff;
            border: 1px solid #10a37f;
            border-radius: 6px;
            box-sizing: border-box;
            color: #2d333a;
            font-family: inherit;
            font-size: 16px;
            height: 52px;
            padding: 0 16px;
            transition: box-shadow .2s ease-in-out, border-color .2s ease-in-out;
            width: 100%;
            margin-top: 40px;
        }

            .form-control:focus {
                border-color: black;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
                outline: none;
            }

            .form-control[data-filled="true"] {
                border-color: green;
            }

        
        .btn-submit {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 52px;
            width: 100%;
            background-color: #10a37f;
            color: #fff;
            margin: 24px 0;
            border-radius: 6px;
            padding: 4px 16px;
            font: inherit;
            border-width: 0;
            cursor: pointer;
            margin-top: 50px;
        }

            .btn-submit:hover {
                background-color: #0056b3;
            }

       
        @media (max-width: 768px) {
            .header h1 {
                font-size: 20px;
            }

            .btn-submit {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Page Header with Image and Feeds Title -->
            <div class="header">
                <img src="assets/img/doctor_16802630.png" alt="Doctor Icon" />
                <h1>Doctor Management</h1>
            </div>

            <!-- Doctor Management Form Section -->
            <div class="content">
                <div class="row justify-content-center align-items-center" style="min-height: 70vh;">
                    <div class="col-md-8 col-lg-6">
                        <div class="form-group">
                            <label for="doctorDate" class="form-label">Select Date*</label>
                            <asp:TextBox ID="doctorDate" CssClass="form-control form-control-lg" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="doctorDropdown" class="form-label">Cattle Name*</label>
                            <asp:DropDownList ID="ddldoctorname" runat="server" CssClass="form-control form-control-lg" DataTextField="animal_name" DataValueField="animal_name"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="doctorrsn" class="form-label">Reason*</label>
                            <asp:TextBox ID="doctorrsn" CssClass="form-control form-control-lg" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="doctorPrice" class="form-label">Price*</label>
                            <asp:TextBox ID="doctorPrice" CssClass="form-control form-control-lg" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnSubmitdoctor" OnClick="btnSubmitdoctor_Click" OnClientClick="return valid()" Text="Submit" CssClass="btn-submit" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <script>
        function valid() {
            var date = document.getElementById('<%= this.doctorDate.ClientID %>').value;
            var Aname = document.getElementById('<%= this.ddldoctorname.ClientID %>').value;
            var rsn = document.getElementById('<%= this.doctorrsn.ClientID %>').value;
            var price = document.getElementById('<%= this.doctorPrice.ClientID %>').value;

            if (date == "" || Aname == "" || rsn == "" || price == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }

            return true;
        }
    </script>


    <!-- Back button handling script -->
    <script type="text/javascript">
        window.onpopstate = function (event) {
            window.location.href = 'WebPage.aspx'; 
        };

        window.onload = function () {
            if (history.state === null) {
                history.pushState({}, 'Doctor', window.location.href);
            }

            const img = document.querySelector('.header img');
            const h1 = document.querySelector('.header h1');

            img.style.transition = 'transform 1s ease-in-out';
            h1.style.transition = 'transform 1s ease-in-out 0.2s'; 

            img.style.transform = 'translateX(0)';
            h1.style.transform = 'translateX(0)';
        };

        window.addEventListener('DOMContentLoaded', function () {
            const img = document.querySelector('.header img');
            const h1 = document.querySelector('.header h1');

            img.style.transform = 'translateX(100%)';
            h1.style.transform = 'translateX(100%)';
        });
    </script>



</body>
</html>
