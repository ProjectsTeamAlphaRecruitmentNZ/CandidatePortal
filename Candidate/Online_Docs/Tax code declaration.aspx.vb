Imports System
Imports System.Web
Imports System.Web.UI
Imports System.IO
Imports HiQPdf
Imports StayinFront.Engine

Partial Class Tax_code_declaration
    Inherits System.Web.UI.Page
    Dim convertCrtPageToPdf As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")

        TestBox.Text = Request.Cookies().Count

        If Not Page.IsPostBack Then

            If objCandidate IsNot Nothing Then

                FullName.Text = GetValue(objCandidate, "Name.FirstName") & " " & GetValue(objCandidate, "Name.MiddleName") & " " & GetValue(objCandidate, "Name.LastName")
                Dim signatureSrc As String = GetValue(objCandidate, "Username")
                SignatureImg.ImageUrl = "../../../savefiles/" + signatureSrc + "_Signa.png"
            End If
        End If
    End Sub
    Protected Overrides Sub Render(writer As HtmlTextWriter)
        If convertCrtPageToPdf Then
            Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
            If objCandidate IsNot Nothing Then
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

                'SET AUTHENTICATION TO REQUEST CSS, IMAGES
                Dim coockies As HttpCookieCollection = Request.Cookies()
                Dim coockieKeys As String() = coockies.AllKeys

                For i As Integer = 0 To coockieKeys.Length - 1
                    Dim coockie As HttpCookie = coockies(coockieKeys(i))
                    htmlToPdfConverter.HttpCookies.AddCookie(coockie.Name, coockie.Value)
                Next

                'Set width of window
                htmlToPdfConverter.BrowserWidth = 1630

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



                'Send pdf to consultant
                'Using mm As New MailMessage("timesheets@alphajobs.co.nz", GetValue(oTSInst, "Job.Consultant.eMailAddress"))
                '    mm.Subject = "Timesheet Alert -" & GetValue(oTSInst, "Candidate.Name.FirstName") & " " & GetValue(oTSInst, "Candidate.Name.LastName")
                '    Dim bcc As MailAddress = New MailAddress("support@alphajobs.co.nz")
                '    mm.Bcc.Add(bcc)
                '    mm.Body = "<html><body style='font-family:Tahoma; font-size:14px; color:#333;'> Hi " & GetValue(oTSInst, "Job.Consultant.eMailAddress.Name.FirstName") & ","
                '    mm.Body &= "<br/><br/>" & oTSInst.Candidate.prompt & " has submitted a timesheet for weekending:<b>" & GetValue(oTSInst, "WeekEndingDate") & "</b> for contract job: <b>" & GetValue(oTSInst, "Job.JobId") & "</b> which is a Daily Rate job."
                '    mm.Body &= "<br/>This candidate has not worked standard hours on one or more of the days in this week.  Please check, and if necessary edit the <b>Total Days</b> manually. </body></html>"

                '    Dim smtp As New SmtpClient()
                '    smtp.Host = "10.10.1.29"
                '    'smtp.EnableSsl = True
                '    'Dim NetworkCred As New NetworkCredential("sender@gamail.com", "password")
                '    'smtp.UseDefaultCredentials = True
                '    'smtp.Credentials = NetworkCred
                '    smtp.Port = 25
                '    smtp.Send(mm)
                'End Using

                Dim pdfPath As String = "C:\inetpub\wwwroot\savefiles\"
                pdfPath += Session("Username") + "_TaxCodeDeclaration.pdf"
                Using pdfStream As New FileStream(pdfPath, FileMode.Create, FileAccess.Write, FileShare.Read)

                    pdfStream.Write(pdfBuffer, 0, pdfBuffer.Length)
                End Using

                Dim objMimeDocument As New Elk9Utils.MimeDocument
                objMimeDocument.LoadFromFile(pdfPath, False)

                Dim objDoc As IAeClassInst
                objDoc = objCandidate.Folders("Documents").CreateNewInstance
                SetValue(objDoc, "MimeType", "application/pdf")
                SetValue(objDoc, "Name", Session("Username") + "_TaxCodeDeclaration.pdf")
                SetValue(objDoc, "FileSize", My.Computer.FileSystem.GetFileInfo(pdfPath).Length / 1024)
                SetValue(objDoc, "DocumentDescription", Session("Username") + "_TaxCodeDeclaration.pdf")
                SetValue(objDoc, "CandidateCV", False)
                SetValue(objDoc, "Compressed", True)
                SetValue(objDoc, "Content", objMimeDocument.GetContent(True))
                SetValue(objDoc, "VisibleOnWeb", True)

                SetValue(objDoc, "Stage", "Complete")
                SetValue(objDoc, "Type", "Online")

                objDoc.Save()

                'Dim docPackLib = objCandidate.Folders("CandidateDocPackLibraries").Scan("")
                'For Each docPack In docPackLib
                '    Dim Code As String = GetValue(docPack, "DocumentLibrary.DocumentCode")
                '    If Code = "ATP-TC" Or Code = "HAT-TC" Or Code = "TTP-TC" Then
                '        SetValue(docPack, "Status", False)
                '    End If
                'Next
                objCandidate.Save()

                'Call End() method of HTTP response to stop ASP.NET page processing

                HttpContext.Current.Response.End()
            End If
        Else
            MyBase.Render(writer)
        End If

    End Sub


    Protected Sub buttonConvertCurrentPageToPdf_Click(Sender As Object, e As EventArgs)
        convertCrtPageToPdf = True
    End Sub
End Class
