<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Audiowide&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet" />

    <!-- Sweet Alert -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />


    <style>
       
        .header {
            position: fixed;
            width: 100%;
            top: 0;
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
            z-index: 1000;
        }

        .content {
            margin-top: 100px;
        }

      
        @keyframes slideIn {
            0% {
                transform: translateX(-100%);
                opacity: 0.2;
            }

            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        
        .profile-image {
            display: block;
            max-width: 100%;
            height: auto;
            width: 300px;
            margin-right: 40px;
            opacity: 0.9;
            animation: slideIn 2s ease-out;
        }

       
        .right-side-content {
            text-align: left;
        }

        h3 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 30px;
        }

        .about-paragraph {
            font-size: 1.15rem;
            line-height: 1.8;
            margin: 20px 0;
            padding: 15px 20px;
            font-family: "Inter", sans-serif;
            color: #333;
            letter-spacing: 0.3px;
            background-color: #fafafa;
            border-left: 4px solid #008080;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: justify;
        }


       
        .feedback-form {
            margin: 50px auto;
            max-width: 600px;
            text-align: center;
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

        .form-group {
            position: relative;
            margin-bottom: 15px;
        }

        .form-control {
            appearance: none;
            background-color: #fff;
            border: 1px solid #10a37f;
            border-radius: 6px;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            color: #2d333a;
            margin-top: 20px;
            transition: border-color 0.3s, box-shadow 0.3s;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

            .form-control:focus {
                border-color: green;
            }

        .btn-primary {
            background-color: #008080;
            border: none;
        }

       
        .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }

            .footer .social-icon {
                margin: 0 10px;
                cursor: pointer;
            }

        @media (max-width: 768px) {
            .profile-image {
                width: 100%;
                margin-bottom: 20px;
            }

            .right-side-content {
                text-align: center;
            }
        }

        .Ahead {
            font-family: "Audiowide", sans-serif;
            color: orange;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      
        <div class="header">
            <h2>About</h2>
        </div>

       
        <div class="container content">
            <div class="row d-flex justify-content-center align-items-center">
                <!-- Image on the Left -->
                <div class="col-md-4 text-center">
                    <img src="assets/img/Cowner.png" class="profile-image" alt="Image" />
                </div>

               
                <div class="col-md-8 right-side-content">
                    <h3 class="Ahead">Suyash Patil...!</h3>
                    <p class="about-paragraph">
                        As a web developer with experience in ASP.NET, I created this web app to solve a specific problem related to record-keeping for our dairy farm. The traditional method of manually keeping records in a physical register is time-consuming, and when you need to calculate profits or review expenses, it's difficult and slow to access. This app saves time by allowing records, profit, and expense tracking to be done in just a few seconds. Plus, it's portable, so you can access and manage the data from anywhere, making it much more efficient for running the business.
                    </p>
                </div>
            </div>

            <div class="row">
                <div class="feedback-form col-md-12">
                    <h3>Feedback</h3>
                    <p class="about-paragraph" style="margin: 20px 20px 70px;">
                        Your feedback is important to me as a user of this web app. I would greatly appreciate your input on whether anything is missing or could be improved. Understanding how the app benefits you is important , as it helps me to make sure it works well for your needs.. Please take a moment to share your thoughts and suggestions.
                    </p>

                    <div class="form-group mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <asp:TextBox CssClass="form-control" ID="username" runat="server" placeholder="Enter your name"></asp:TextBox>
                    </div>
                    <div class="form-group mb-3">
                        <label for="feedback" class="form-label">Feedback:</label>
                        <asp:TextBox CssClass="form-control" ID="feedback" runat="server" TextMode="MultiLine" Rows="5" placeholder="Write your feedback here"></asp:TextBox>
                    </div>
                    <asp:Button CssClass="btn btn-primary" ID="SubmitFeedback" OnClick="SubmitFeedback_Click" OnClientClick="return valid()" Text="Submit" runat="server" />
                </div>
            </div>
        </div>

       
        <div class="footer">
            <a href="tel:+918180821173" class="social-icon">
                <img src="assets/img/mobile.png" alt="Call" style="width: 40px;" />
            </a>
            <a href="https://wa.me/918180821173" target="_blank" class="social-icon">
                <img src="assets/img/whatsapp.png" alt="WhatsApp" style="width: 40px;" />
            </a>
            <a href="https://www.instagram.com/suyash_.0203?igsh=OGk2NTU0em03c3pr" target="_blank" class="social-icon">
                <img src="assets/img/instagram.png" alt="Instagram" style="width: 40px;" />
            </a>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function valid() {
            var name = document.getElementById('<%= this.username.ClientID %>').value;
            var feedback = document.getElementById('<%= this.feedback.ClientID %>').value;

            if (name == "" || feedback == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }

            return true;
        }
    </script>

    <script type="text/javascript">

        window.onpopstate = function (event) {
            window.location.href = 'WebPage.aspx';
        };

        window.onload = function () {
            if (history.state === null) {
                history.pushState({}, 'About', window.location.href);
            }
        };
 </script>

</body>
</html>
