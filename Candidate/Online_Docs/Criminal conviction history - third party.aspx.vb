Imports System
Imports System.Web
Imports System.Web.UI
Imports System.IO
Imports HiQPdf
Imports StayinFront.Engine

Partial Class Criminal_conviction_history___third_party
    Inherits System.Web.UI.Page
    Dim convertCrtPageToPdf As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        If Not Page.IsPostBack Then

            If objCandidate IsNot Nothing Then
                'ThirdParty.Text = GetValue(objCandidate, "EmploymentDetail.Organisation")
                Dim organisationName As String = GetValue(objCandidate, "EmploymentDetail.Organisation")
                ThirdPartyPerson.Text = organisationName
                ThirdParty.Text = organisationName

                Dim organisation As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Organisation", False, "Name='" & organisationName & "'")

                Address.Text = GetValue(organisation, "Address.Address")
                OrgSuburb.Text = GetValue(organisation, "Address.Suburb")
                OrgCity.Text = GetValue(organisation, "Address.City")
                OrgCountry.Text = GetValue(organisation, "Address.Country.Name")
                OrgPostCode.Text = GetValue(organisation, "Address.PostCode")

                FirstName.Text = GetValue(objCandidate, "Name.FirstName")
                LastName.Text = GetValue(objCandidate, "Name.LastName")
                MiddleName.Text = GetValue(objCandidate, "Name.MiddleName")
                If GetValue(objCandidate, "DOB.DateDay") IsNot Nothing Then
                    'Dim dob1 As String = System.Convert.ToString(GetValue(objCandidate, "DOB.DateDay"))
                    'Dim dob2 As String = System.Convert.ToString(GetValue(objCandidate, "DOB.DateMonth"))
                    'Dim dob3 As String = System.Convert.ToString(GetValue(objCandidate, "DOB.DateYear"))
                    'Dim dayArr = dob1.ToCharArray
                    'Dim monthArr = dob2.ToCharArray
                    'Dim yearArr = dob3.ToCharArray
                    'If dayArr.Length < 2 Then
                    '    dayArr(1) = dayArr(0)
                    '    dayArr(0) = "0"
                    'End If
                    'D1.Value = dayArr(0)
                    'D2.Value = dayArr(1)
                    'M1.Value = monthArr(0)
                    'M2.Value = monthArr(1)
                    'Y1.Value = yearArr(0)
                    'Y2.Value = yearArr(1)
                    'Y3.Value = yearArr(2)
                    'Y4.Value = yearArr(3)
                End If

                If GetValue(objCandidate, "Gender") = "Male" Then
                    Male.Checked = True
                Else
                    Female.Checked = True
                End If
                POB.Text = GetValue(objCandidate, "CandidatePlaceOfBirth")
                LandLine.Text = GetValue(objCandidate, "Phone.AreaCode") & " " & GetValue(objCandidate, "Phone.Number")
                Mobile.Text = GetValue(objCandidate, "Mobile.AreaCode") & " " & GetValue(objCandidate, "Mobile.Number")
                Email.Text = GetValue(objCandidate, "Emailaddress.eMailAddress")

                CandAddress.Text = GetValue(objCandidate, "Address.Address")
                CandSuburb.Text = GetValue(objCandidate, "Address.Suburb")
                CandCity.Text = GetValue(objCandidate, "Address.City")
                'CandState.Text = GetValue(objCandidate, "Address.State")
                CandPostCode.Text = GetValue(objCandidate, "Address.PostCode")
                CandCountry.Text = GetValue(objCandidate, "Address.Country.Name")
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

            'SET AUTHENTICATION TO REQUEST CSS, IMAGES
            Dim coockies As HttpCookieCollection = Request.Cookies()
            Dim coockieKeys As String() = coockies.AllKeys

            For i As Integer = 0 To coockieKeys.Length - 1
                Dim coockie As HttpCookie = coockies(coockieKeys(i))
                htmlToPdfConverter.HttpCookies.AddCookie(coockie.Name, coockie.Value)
            Next

            'Set width of window

            htmlToPdfConverter.BrowserWidth = 1585
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

            'Save in Omega
            Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")

            Dim pdfPath As String = "C:\inetpub\wwwroot\savefiles\"
            pdfPath += Session("Username") + "_CriminalConviction.pdf"
            Using pdfStream As New FileStream(pdfPath, FileMode.Create, FileAccess.Write, FileShare.Read)

                pdfStream.Write(pdfBuffer, 0, pdfBuffer.Length)
            End Using

            Dim objMimeDocument As New Elk9Utils.MimeDocument
            objMimeDocument.LoadFromFile(pdfPath, False)

            Dim objDoc As IAeClassInst
            objDoc = objCandidate.Folders("Documents").CreateNewInstance
            SetValue(objDoc, "MimeType", "application/pdf")
            SetValue(objDoc, "Name", Session("Username") + "_CriminalConviction.pdf")
            SetValue(objDoc, "FileSize", My.Computer.FileSystem.GetFileInfo(pdfPath).Length / 1024)
            SetValue(objDoc, "DocumentDescription", Session("Username") + "_CriminalConviction.pdf")
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
