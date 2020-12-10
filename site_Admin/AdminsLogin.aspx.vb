Imports MySql.Data.MySqlClient

Public Class AdminsLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub TextBox2_TextChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If TextBox1.Text.Equals("") Then

        End If


        Dim cs As String = "server=ucap.cfqaouqaacej.us-east-1.rds.amazonaws.com; user id=DBGod; password=J!J!S_!AG!G-2020y; database=UCAP-Main;"
        Dim conn As MySqlConnection

        Try
            conn = New MySqlConnection(cs)
            conn.Open()

            Dim StrVar As String
            Dim rd As MySqlDataReader
            Dim cmd As New MySqlCommand

            cmd.CommandText = "SELECT Password from Administrativos where ID_Administrativo = " + TextBox1.Text + ""
            cmd.Connection = conn
            rd = cmd.ExecuteReader

            If rd.Read Then

                StrVar = rd.GetString(0)
                If StrVar.Equals(TextBox2.Text) Then
                    Response.Redirect("Inicio.aspx")
                Else
                    Label1.Text = "Contraseña Incorrecta"
                End If
                rd.Close()
            End If

            rd.Close()

        Catch ex As MySqlException
                Label1.Text = ex.Message
            Finally
            conn.Close()
        End Try


    End Sub
End Class