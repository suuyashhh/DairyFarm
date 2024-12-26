<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="WebApplication1.Notes" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Saira:wght@400;500;600&display=swap" rel="stylesheet" />


    <!-- Sweet Alert -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
    <style>
        body,
        html {
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
            margin-bottom: 20px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            width: 100%;
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

        .note-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            margin: 10px 0;
            padding: 15px;
            background-color: #f9f9f9;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .note-card:hover {
                background-color: #f1f1f1;
            }

        .note-title {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 5px;
        }

        .note-body {
            font-size: 16px;
            display: none;
            margin-top: 10px;
        }

        .note-time {
            font-size: 14px;
            color: gray;
            margin-top: 8px;
        }

        .delete-btn {
            display: none;
            background-color: red;
            color: white;
            margin-top: 40px;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
            width: 20%;
            transition: background-color 0.3s;
        }

            .delete-btn:hover {
                background-color: darkred;
            }


        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: white;
            padding: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }

        .new-note-btn {
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            text-decoration: none;
        }

        @media (max-width: 768px) {
            .note-card {
                font-size: 14px;
            }

            .delete-btn {
                font-size: 14px;
            }
        }

        .note-card a {
            color: black;
            text-decoration: none;
        }


            .note-card a:hover {
                color: #555;
                text-decoration: none;
            }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container-fluid">


            <div class="header">
                <img src="assets/img/Notes_752326.png" alt="Feed Icon" />
                <h1>Notes</h1>
            </div>

            <div style="margin-top: 150px"></div>

            <div class="container mt-4" style="margin-bottom: 100px;">
                <!-- Note List -->

                <asp:Repeater runat="server" ID="NoteRep">

                    <ItemTemplate>
                        <div class="note-card" onclick="toggleNoteContent(this)">
                            <div>
                                <div class="note-title"><a class="note-title" href='#'><%# Eval("title_note") %></a></div>
                                <div class="note-body">
                                    <a href='#'><%# Eval("body_note") %></a>
                                </div>
                                <div class="note-time"><a href='#'><%# Eval("date","{0:dd-MMM-yyyy}") %></a></div>
                            </div>
                            <%--<asp:Button runat="server" ID="btn_Delete" Text="Delete" CssClass="delete-btn" />--%>
                            <asp:LinkButton runat="server" ID="btn_Delete" Text="Delete" CssClass="delete-btn" OnClientClick="return confirm('Do you want to delete this Item?')" OnClick="btn_Delete_Click" Style="color: white;">Delete</asp:LinkButton>
                        </div>

                        <asp:Label runat="server" ID="DelRep" Style="display: none" Text='<%# Eval("note_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:Repeater>


            </div>


            <div class="footer">
                <a href="#" class="new-note-btn" onclick="toggleNewNote()">+</a>
            </div>


            <div id="new-note-form" class="container mt-4" style="display: none; margin-bottom: 100px;">

                <div class="d-flex justify-content-between align-items-center">
                    <button class="btn btn-outline-secondary" id="back-btn" onclick="hideNewNoteForm()">←</button>
                    <asp:Button ID="Btn_save" runat="server" OnClick="Btn_save_Click" OnClientClick="return valid()" Text="Save" CssClass="btn btn-primary" />
                </div>


                <div class="form-group mt-3">
                    <label for="note-title" class="form-label" style="font-weight: bold;">Input The Title</label>
                    <asp:TextBox ID="txtNoteTitle" runat="server" CssClass="form-control-plaintext" placeholder="Input The Title"
                        Style="border-bottom: 1px solid #ddd; font-size: 18px;" />
                </div>


                <div class="form-group mt-4">
                    <asp:TextBox ID="txtNoteBody" runat="server" TextMode="MultiLine" CssClass="form-control-plaintext" Rows="10"
                        placeholder="Start typing your note..." Style="border-bottom: 1px solid #ddd; font-size: 16px; width: 100%;" />
                </div>
            </div>


        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


    <%--    <script>

        function toggleNewNote() {

            const contentContainer = document.querySelector('.container');
            const newNoteForm = document.getElementById('new-note-form');


            if (newNoteForm.style.display === 'block') {

                hideNewNoteForm();
            } else {

                contentContainer.style.display = 'none';
                newNoteForm.style.display = 'block';
            }
        }


        function hideNewNoteForm() {

            document.querySelector('.container').style.display = 'block';
            document.getElementById('new-note-form').style.display = 'none';
        }


    </script>--%>


    <script>
        function toggleNoteContent(noteCard) {
            const noteBody = noteCard.querySelector('.note-body');
            const deleteButton = noteCard.querySelector('.delete-btn');

            if (noteBody.style.display === "none" || noteBody.style.display === "") {
                noteBody.style.display = "block";
                deleteButton.style.display = "block";
            } else {
                noteBody.style.display = "none";
                deleteButton.style.display = "none";
            }
        }
    </script>

    <script>
        function valid() {
            var Title = document.getElementById('<%= this.txtNoteTitle.ClientID %>').value;
            var Body = document.getElementById('<%= this.txtNoteBody.ClientID %>').value;


            if (Title == "" || Body == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }


            return true;
        }
    </script>


    <script>
        function toggleNewNote() {
            const contentContainer = document.querySelector('.container');
            const newNoteForm = document.getElementById('new-note-form');


            if (newNoteForm.style.display === 'block') {
                hideNewNoteForm();
            } else {
                contentContainer.style.display = 'none';
                newNoteForm.style.display = 'block';
            }
        }

        function hideNewNoteForm() {
            document.querySelector('.container').style.display = 'block';
            document.getElementById('new-note-form').style.display = 'none';
        }


        window.onpopstate = function (event) {

            if (event.state) {
                window.location.href = 'WebPage.aspx';
            }
        };


        window.onload = function () {

            if (history.state === null) {
                history.pushState({ page: 'Doctor' }, 'Doctor', window.location.href);
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
