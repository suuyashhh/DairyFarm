<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnimalsName.aspx.cs" Inherits="WebApplication1.AnimalsName" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Cattle & Feed Master</title>

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />

    <!-- Sweet Alert -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Saira:wght@400;500;600&display=swap" rel="stylesheet"/>


    <!-- Custom CSS -->
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: "Saira", sans-serif;
        }

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
                height: 40px;
                margin-right: 10px;
            }

            .header h1 {
                font-size: 24px;
                margin: 0;
                color: #495057;
            }

        .content {
            padding: 100px 20px 50px;
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

        .grid-view {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <img src="assets/img/cow_9466827.png" alt="Animal Icon" />
            <h1>Cattel & Feed Master</h1>
        </div>

        <div class="content container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <h2>Cattle Master</h2>
                    <div class="form-group">
                        <label for="animalName" class="form-label">Cattle Name*</label>
                        <asp:TextBox ID="animalName" CssClass="form-control" runat="server" onkeyup="checkInput(this)"></asp:TextBox>
                    </div>
                    <asp:Button runat="server" ID="btnSubmitAnimal" Text="Submit" OnClientClick="return valid()" OnClick="btnSubmitAnimal_Click" CssClass="btn-submit" />
                </div>
                <div class="col-md-6 grid-view">
                    <h2>Manage Cattle</h2>
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="gridAnimal" DataKeyNames="animal_id" AutoGenerateColumns="false" OnRowEditing="gridAnimal_RowEditing" OnRowCancelingEdit="gridAnimal_RowCancelingEdit" OnRowUpdating="gridAnimal_RowUpdating" OnRowDeleting="gridAnimal_RowDeleting" CssClass="table " Style="text-align: center; margin-top: 40px; border: 1px solid #10a37f; border-radius: 6px;">
                            <Columns>
                                <asp:TemplateField HeaderText="Name:">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblname" Text='<%# Eval("animal_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtname" Text='<%# Eval("animal_name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="190" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-md-6">
                    <h2>Feed Master</h2>
                    <div class="form-group">
                        <label for="feedName" class="form-label">Feed Name*</label>
                        <asp:TextBox ID="feedName" CssClass="form-control" runat="server" onkeyup="checkInput(this)"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmitFeed" Text="Submit" OnClick="btnSubmitFeed_Click" OnClientClick="return validF()" CssClass="btn-submit" runat="server" />
                </div>
                <div class="col-md-6 grid-view">
                    <h2>Manage Feeds</h2>
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="gridFeed" DataKeyNames="feed_id" AutoGenerateColumns="false" OnRowEditing="gridFeed_RowEditing" OnRowCancelingEdit="gridFeed_RowCancelingEdit" OnRowUpdating="gridFeed_RowUpdating" OnRowDeleting="gridFeed_RowDeleting" CssClass="table " Style="text-align: center; border: 1px solid #10a37f; border-radius: 6px; margin-top: 40px">
                            <Columns>
                                <asp:TemplateField HeaderText="Name:">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblname" Text='<%# Eval("feed_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtname" Text='<%# Eval("feed_name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="190" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function checkInput(input) {
            if (input.value.trim() !== '') {
                input.setAttribute('data-filled', 'true');
            } else {
                input.removeAttribute('data-filled');
            }
        }
    </script>


    <script>
        function valid() {
            var name = document.getElementById('<%= this.animalName.ClientID %>').value;


            if (name == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }


            return true;
        }
    </script>


    <script>
        function validF() {
            var name = document.getElementById('<%= this.feedName.ClientID %>').value;


            if (name == "") {
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
                history.pushState({}, 'Animal', window.location.href);
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
