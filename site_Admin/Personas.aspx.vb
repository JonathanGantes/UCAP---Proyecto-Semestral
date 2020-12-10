Imports System.Drawing
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class Personas
    Inherits System.Web.UI.Page

    Dim connectionString As String = "server=ucap.cfqaouqaacej.us-east-1.rds.amazonaws.com; user id=DBGod; password=J!J!S_!AG!G-2020y; database=UCAP-Main;"
    Dim SQLConnection As MySqlConnection = New MySqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        SQLConnection = New MySqlConnection()
        SQLConnection.ConnectionString = connectionString
        Dim sqlCommand As New MySqlCommand
        Dim str_carSql As String

        Dim Sexo As String

        If CheckBox1.Checked Then
            Sexo = "M"
        End If

        If CheckBox2.Checked Then
            Sexo = "F"
        End If

        If AllDataCompleted() Then
            Try
                SQLConnection.Open()
                str_carSql = "insert into Persona (Cedula, Nombre1, Nombre2, Apellido1, Apellido2, Fecha_Nac, Sexo, Correo_e, Direccion) values ('" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "', '" + TextBox5.Text + "', '" + Sexo + "', '" + TextBox6.Text + "', '" + TextBox8.Text + "')"
                sqlCommand.Connection = SQLConnection
                sqlCommand.CommandText = str_carSql
                sqlCommand.ExecuteNonQuery()
                SQLConnection.Close()
                GridView1.DataBind()
                Clear()

                Label1.Text = "Se Inserto con Exito"
            Catch ex As Exception
                SQLConnection.Close()
                Label1.Text = "Error: " + ex.Message

            End Try

        Else
            Label1.Text = "Complete todos los campos obligatorios"
        End If

    End Sub
    Function Clear()
        Label1.Text = ""
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox7.Text = ""
        CheckBox1.Checked = False
        CheckBox2.Checked = False

        GridView1.DataBind()
    End Function

    Function AllDataCompleted() As Boolean

        If Not TextBox7.Text.Equals("") Then 'Si el Campo de Cedula no esta vacio'

            If Not TextBox1.Text.Equals("") Then 'Si el Campo de Nombre1 no esta vacio'

                If Not TextBox3.Equals("") Then 'Si el Campo de Apellido1 no esta vacio'

                    If Not TextBox5.Text.Equals("") Then 'Si el Campo de Fecha no esta vacio'

                        If CheckBox1.Checked Or CheckBox2.Checked Then 'Alguno de los Cososos esta check'
                            Return True
                        Else
                            Return False
                        End If

                    Else
                        Return False
                    End If

                Else
                    Return False
                End If

            Else
                Return False
            End If


        Else
            Return False
        End If


    End Function

    Protected Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked Then
            CheckBox2.Checked = False
        End If

    End Sub

    Protected Sub CheckBox2_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox2.CheckedChanged
        If CheckBox2.Checked Then
            CheckBox1.Checked = False
        End If
    End Sub

End Class