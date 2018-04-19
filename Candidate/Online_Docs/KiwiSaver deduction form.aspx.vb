Imports System
Imports System.Web
Imports System.Web.UI
Imports System.IO
Imports HiQPdf
Imports StayinFront.Engine

Partial Class KiwiSaver_deduction_form
    Inherits System.Web.UI.Page
    Dim convertCrtPageToPdf As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        If Not Page.IsPostBack Then
            If objCandidate IsNot Nothing Then

                Dim signatureSrc As String = GetValue(objCandidate, "Username")
                SignatureImg.ImageUrl = "../../../savefiles/" + signatureSrc + "_Signa.png"

                Dim FirstName As String = GetValue(objCandidate, "Name.FirstName")
                If FirstName IsNot Nothing Then
                    Dim count = FirstName.Length
                    Dim fnArr As Char() = FirstName.ToCharArray()
                    Dim fnCount = 1
                    For Each ch In fnArr
                        Dim spellID As String = "FN" & fnCount
                        Dim spellControl As TextBox = FNPanel.FindControl(spellID)
                        spellControl.Text = ch
                        fnCount += 1
                    Next
                End If

                Dim LastName As String = GetValue(objCandidate, "Name.LastName")
                If LastName IsNot Nothing Then
                    Dim countLN = LastName.Length
                    Dim lnArr As Char() = LastName.ToCharArray()
                    Dim lnCount = 1
                    For Each ch In lnArr
                        Dim spellID As String = "LN" & lnCount
                        Dim spellControl As TextBox = LNPanel.FindControl(spellID)
                        spellControl.Text = ch
                        lnCount += 1
                    Next
                End If

                Dim Suburb As String = GetValue(objCandidate, "Address.Suburb")
                If Suburb IsNot Nothing Or Suburb <> "" Then
                    Dim countSuburb = Suburb.Length
                    Dim SuburbArr As Char() = Suburb.ToCharArray()
                    Dim SuburbCount = 1
                    For Each ch In SuburbArr
                        Dim spellID As String = "Suburb" & SuburbCount
                        Dim spellControl As TextBox = SuburbPanel.FindControl(spellID)
                        'spellControl.Text = ch
                        SuburbCount += 1
                    Next
                End If


                Dim City As String = GetValue(objCandidate, "Address.City")
                If City IsNot Nothing Then
                    Dim countCity = City.Length
                    Dim CityArr As Char() = City.ToCharArray()
                    Dim CityCount = 1
                    For Each ch In CityArr
                        Dim spellID As String = "City" & CityCount
                        Dim spellControl As TextBox = CityPanel.FindControl(spellID)
                        spellControl.Text = ch
                        CityCount += 1
                    Next
                End If

                Dim PostCode As String = GetValue(objCandidate, "Address.PostCode")
                If PostCode IsNot Nothing Then
                    Dim countPostCode = PostCode.Length
                    Dim PostCodeArr As Char() = PostCode.ToCharArray()
                    Dim PostCodeCount = 1
                    For Each ch In PostCodeArr
                        Dim spellID As String = "PostCode" & PostCodeCount
                        Dim spellControl As TextBox = PostCodePanel.FindControl(spellID)
                        spellControl.Text = ch
                        PostCodeCount += 1
                    Next
                End If

                Dim Email As String = GetValue(objCandidate, "eMailAddress.eMailAddress")
                If Email IsNot Nothing Then
                    Dim countEmail = Email.Length
                    Dim EmailArr As Char() = Email.ToCharArray()
                    Dim EmailCount = 1
                    For Each ch In EmailArr
                        Dim spellID As String = "Email" & EmailCount
                        Dim spellControl As TextBox = EmailPanel.FindControl(spellID)
                        spellControl.Text = ch
                        EmailCount += 1
                    Next
                End If

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

            'convert only the HTML element having the MyHtmlElement ID 
            htmlToPdfConverter.ConvertedHtmlElementSelector = "#printableArea"
            'SET AUTHENTICATION TO REQUEST CSS, IMAGES
            Dim coockies As HttpCookieCollection = Request.Cookies()
            Dim coockieKeys As String() = coockies.AllKeys

            For i As Integer = 0 To coockieKeys.Length - 1
                Dim coockie As HttpCookie = coockies(coockieKeys(i))
                htmlToPdfConverter.HttpCookies.AddCookie(coockie.Name, coockie.Value)
            Next

            'Set width of window
            htmlToPdfConverter.BrowserWidth = 1530

            htmlToPdfConverter.Document.PageSize = PdfPageSize.A4
            htmlToPdfConverter.Document.ResizePageWidth = True
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
