Imports System
Imports System.Web

Namespace Rextester
    Public Module Program
        Public Sub Main(args() As string)
            'Your code goes here
    For value As Integer = 0 To 100000000   
            Dim decodedUrl As String = HttpUtility.UrlDecode("http%3A%2F%2Ffoo%20bar%2F" + value.ToString())
           'Console.WriteLine(decodedUrl)
	Next
        End Sub
    End Module
End Namespace
