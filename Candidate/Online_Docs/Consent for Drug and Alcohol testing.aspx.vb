Imports System
Imports System.Web
Imports System.Web.UI
Imports System.IO
Imports HiQPdf
Imports StayinFront.Engine

Partial Class Consent_for_Drug_and_Alcohol_testing
    Inherits System.Web.UI.Page
    Dim convertCrtPageToPdf As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        If Not Page.IsPostBack Then


            If objCandidate IsNot Nothing Then
                Donor.Text = GetValue(objCandidate, "Name.FirstName") & " " & GetValue(objCandidate, "Name.LastName")
                Dim organisationName As String = GetValue(objCandidate, "EmploymentDetail.Organisation")
                Company.Text = organisationName

            End If
        End If
    End Sub
    Protected Overrides Sub Render(writer As HtmlTextWriter)
        If convertCrtPageToPdf Then
            'setup a TextWriter to capture the current page HTML code
            Dim tw As TextWriter = New StringWriter
            Dim htw As HtmlTextWriter = New HtmlTextWriter(tw)
            'render the HTML markup into the TextWriter
            MyBase.Render(htw)
            'get the current page HTML code
            Dim htmlCode As String = tw.ToString

            'convert the HTML code to PDF

            'create the HTML to PDF converter
            Dim htmlToPdfConverter As HtmlToPdf = New HtmlToPdf

            htmlToPdfConverter.BrowserWidth = 1230
            'convert only the HTML element having the MyHtmlElement ID 
            htmlToPdfConverter.ConvertedHtmlElementSelector = "#printableArea"
            htmlToPdfConverter.Document.PageSize = PdfPageSize.A4
            htmlToPdfConverter.Document.PageOrientation = PdfPageOrientation.Portrait
            htmlToPdfConverter.Document.Margins = New PdfMargins(0)

            'the base URL used to resolve images, CSS and script files
            Dim currentPageUrl As String = HttpContext.Current.Request.Url.AbsoluteUri

            'convert HTML code to a PDF memory buffer
            Dim pdfBuffer As Byte() = htmlToPdfConverter.ConvertHtmlToMemory(htmlCode, currentPageUrl)

            'inform the browser about the binary data format
            HttpContext.Current.Response.AddHeader("Content-Type", "application/pdf")

            'let the browser know how to open the PDF document, attachment or inline, and the file name
            HttpContext.Current.Response.AddHeader("Content-Disposition", String.Format("attachment; filename=ConvertThisHtmlWithState.pdf; size={0}", pdfBuffer.Length.ToString()))

            'write the PDF buffer to HTTP response
            HttpContext.Current.Response.BinaryWrite(pdfBuffer)

            'call End() method of HTTP response to stop ASP.NET page processing
            HttpContext.Current.Response.End()
        Else
            MyBase.Render(writer)
        End If

    End Sub


    Protected Sub buttonConvertCurrentPageToPdf_Click(Sender As Object, e As EventArgs)
        convertCrtPageToPdf = True

    End Sub
End Class
