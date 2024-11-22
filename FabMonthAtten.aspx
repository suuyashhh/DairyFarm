<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabMonthAtten.aspx.cs" Inherits="WebApplication1.Doctor" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Monthly Attendance Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Saira:wght@400;500;600&display=swap" rel="stylesheet" />

    <!-- Sweet Alert -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" />

    <!-- Custom Styles -->
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: "Saira", sans-serif;
        }

        /* Fixed Header */
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
            padding: 100px 15px 20px;
        }

        /* Centered Date Picker Styles */
        .form-container {
            margin: 20px auto;
            text-align: center;
        }

        .date-icon {
            width: 80px;
            cursor: pointer;
        }

        /* Salary Slip Table */
        .salary-slip-table {
            border-collapse: collapse;
            width: 100%;
        }

        .salary-slip-table th, .salary-slip-table td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        .salary-slip-table th {
            background-color: #f2f2f2;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header h1 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Page Header -->
            <div class="header">
                <img src="FabImage/calendar_4310927.png" alt="Doctor Icon" />
                <h1>Monthly Attendance Management</h1>
            </div>

            <div class="container content">
                <!-- Centered Date Picker -->
                <div class="form-container">
                    <img src="FabImage/calendar_4310927.png" alt="Date Picker" class="date-icon" onclick="triggerDatePicker()" />
                    <asp:TextBox ID="txtDate" CssClass="form-control mt-3 w-50 mx-auto" runat="server" TextMode="Date" placeholder="Select Date" />
                </div>

                <!-- Salary Slip Card -->
                <div class="card shadow mt-4">
                    <!-- Header Section -->
                    <div class="card-body">
                        <table class="table table-borderless">
                            <tr>
                                <td><strong>HELPER NAME-</strong><br>__________________</td>
                            </tr>
                        </table>
                    </div>

                    <!-- Title Section -->
                    <div class="card-body text-center">
                        <h5><strong>SALARY SLIP FOR THE MONTH OF -</strong></h5>
                    </div>

                    <!-- Main Table -->
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="salary-slip-table table">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Days</th>
                                        <th>Salary</th>
                                        <th>Total_salary</th>
                                       <%-- <th>NAP</th>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>FULL DAY</td>
                                        <td>13</td>
                                        <td>500</td>
                                        <td>6500</td>
                                       <%-- <td rowspan="5"></td>--%>
                                    </tr>
                                    <tr>
                                        <td>HALF DAY</td>
                                        <td>5</td>
                                        <td>250</td>
                                        <td>1500</td>
                                    </tr>
                                    <tr>
                                        <td>OFF DAY</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>ADVANCE</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                   
                                    <tr>
                                        <td colspan="3"><strong>TOTAL</strong></td>
                                        <td>6767878</td>
                                    </tr>
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function triggerDatePicker() {
            document.getElementById('<%= txtDate.ClientID %>').focus();
        }
    </script>
</body>
</html>
