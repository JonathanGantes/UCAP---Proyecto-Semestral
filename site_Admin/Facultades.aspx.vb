Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.pdf
Imports iTextSharp.tool.xml
Imports MySql.Data.MySqlClient

Public Class Facultades
    Inherits System.Web.UI.Page


    Dim connectionString As String = "server=ucap.cfqaouqaacej.us-east-1.rds.amazonaws.com; user id=DBGod; password=J!J!S_!AG!G-2020y; database=UCAP-Main;"
    Dim SQLConnection As MySqlConnection = New MySqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Clear()


    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        SQLConnection = New MySqlConnection()
        SQLConnection.ConnectionString = connectionString
        Dim sqlCommand As New MySqlCommand
        Dim str_carSql As String

        Try
            SQLConnection.Open()
            str_carSql = "insert into Facultad (Descripción) values ('" + TextBox1.Text + "')"
            sqlCommand.Connection = SQLConnection
            sqlCommand.CommandText = str_carSql
            sqlCommand.ExecuteNonQuery()
            SQLConnection.Close()
            GridView1.DataBind()
            TextBox1.Text = ""
            Clear()

            Label2.Text = "Se Inserto con Exito"
        Catch ex As Exception
            SQLConnection.Close()
            Label2.Text = "Error: " + ex.Message

        End Try


    End Sub

    Function Clear()
        Label2.Text = ""
        GridView1.DataBind()
    End Function


    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub





    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages  
            GridView1.AllowPaging = False
            GridView1.DataBind()

            GridView1.HeaderRow.BackColor = Color.White
            For Each cell As TableCell In GridView1.HeaderRow.Cells
                cell.BackColor = GridView1.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In GridView1.Rows
                row.BackColor = Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = GridView1.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next

            GridView1.RenderControl(hw)
            'style to format numbers to string  
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()
        End Using
    End Sub




End Class