<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CattleBreedingD.aspx.cs" Inherits="WebApplication1.CattleBreedingD" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cattle Breeding Calculator</title>

    <!-- Vendor CSS Files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-icons/bootstrap-icons.css" />
    <link href="https://fonts.googleapis.com/css2?family=Saira:wght@400;500;600&display=swap" rel="stylesheet"/>


    <!-- Custom CSS -->
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: "Saira", sans-serif;
        }

        
        .header {
            position: fixed; 
            top: 0; 
            left: 0;
            right: 0;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 10px 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #ddd;
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
            margin-top: 20px; 
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
            line-height: 1.1;
            outline: none;
            padding-block: 1px;
            padding-inline: 2px;
            padding: 0 16px;
            transition: box-shadow .2s ease-in-out, border-color .2s ease-in-out;
            width: 100%;
            text-rendering: auto;
            letter-spacing: normal;
            word-spacing: normal;
            text-transform: none;
            text-indent: 0;
            text-shadow: none;
            display: inline-block;
            text-align: start;
            margin: 0;
            margin-top: 20px; 
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
            position: relative;
            height: 52px;
            width: 320px;
            background-color: #10a37f;
            color: #fff;
            margin: 24px 0 0;
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
    </style>

    <!-- JavaScript -->
    <script>
        function calculateDates() {
            var animalType = document.getElementById('<%= ddlCattleType.ClientID %>').value;
            var breedingDate = new Date(document.getElementById('<%= txtFromDate.ClientID %>').value);

            if (!breedingDate) return;

            var today = new Date();

            var daysPregnant = Math.floor((today - breedingDate) / (1000 * 60 * 60 * 24));
            document.getElementById('<%= NoDays.ClientID %>').value = daysPregnant;

            var calvingDate, targetDate;

            if (animalType === 'Cow') {
                calvingDate = new Date(breedingDate);
                calvingDate.setMonth(breedingDate.getMonth() + 9);
                document.getElementById('<%= ExpeCal.ClientID %>').value = calvingDate.toISOString().split('T')[0];

                targetDate = new Date(calvingDate);
                targetDate.setDate(calvingDate.getDate() + 9);
                document.getElementById('<%= TargetDate.ClientID %>').value = targetDate.toISOString().split('T')[0];
            } else if (animalType === 'Buffalo') {
                calvingDate = new Date(breedingDate);
                calvingDate.setMonth(breedingDate.getMonth() + 10);
                document.getElementById('<%= ExpeCal.ClientID %>').value = calvingDate.toISOString().split('T')[0];

                targetDate = new Date(calvingDate);
                targetDate.setDate(calvingDate.getDate() + 10);
                document.getElementById('<%= TargetDate.ClientID %>').value = targetDate.toISOString().split('T')[0];
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
           
            <div class="header">
                <img src="assets/img/horse_2632262.png" alt="Feed Icon" />
                <h1>Cattle Breeding Calculator</h1>
            </div>

           
            <div class="content">
                
                <div class="row justify-content-center align-items-center " style="min-height: 70vh !important;">
                    <div class="col-md-4 col-lg-3">
                        <div class="form-group">
                            <label for="ddlCattleType" class="form-label">Select Cattle Type</label>
                            <asp:DropDownList ID="ddlCattleType" runat="server" CssClass="form-control form-control-lg" onchange="calculateDates()" Style="padding: 10px!important">
                                <asp:ListItem Text="Cow" Value="Cow"></asp:ListItem>
                                <asp:ListItem Text="Buffalo" Value="Buffalo"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label for="txtFromDate" style="margin-top: 35px;" class="form-label">AI Date</label>
                            <asp:TextBox ID="txtFromDate" Style="margin-top: 35px;" CssClass="form-control form-control-lg" runat="server" TextMode="Date" onchange="calculateDates()"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="NoDays" style="margin-top: 35px;" class="form-label">No of Days Pregnant</label>
                            <asp:TextBox ID="NoDays" ReadOnly="true" Style="margin-top: 35px; background-color: white;" CssClass="form-control form-control-lg" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="ExpeCal" style="margin-top: 35px;" class="form-label">Expected Date Of Calving</label>
                            <asp:TextBox ID="ExpeCal" ReadOnly="true" Style="margin-top: 35px; background-color: white;" CssClass="form-control form-control-lg" runat="server" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="TargetDate" style="margin-top: 35px;" class="form-label">Target Date</label>
                            <asp:TextBox ID="TargetDate" ReadOnly="true" Style="margin-top: 35px; background-color: white;" CssClass="form-control form-control-lg" runat="server" TextMode="Date"></asp:TextBox>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </form>




   
    <script type="text/javascript">
        window.onpopstate = function (event) {
            window.location.href = 'WebPage.aspx'; 
        };

        window.onload = function () {
            if (history.state === null) {
                history.pushState({}, 'CattleBreedingD', window.location.href);
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
