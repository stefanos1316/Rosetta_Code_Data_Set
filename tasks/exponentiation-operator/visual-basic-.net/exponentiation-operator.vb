Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text.RegularExpressions
Imports System.String

Namespace Rextester
    Public Module Program
        Public Sub Main(args() As string)
           Dim intBase, exponentiationNumber As Integer
           Dim doubleBase, exp1, exp2 As Double
           intBase = 2017
           exponentiationNumber= 12
           doubleBase = 19.88
           'Your code goes here
           For value As Integer = 0 To 2000000000  
            exp1 = (intBase + value) ^ exponentiationNumber 
	    exp2 = (doubleBase+ value) ^ exponentiationNumber 
		exp3 = exp1 = exp2
           Next
        End Sub
    
    
    
End Module
End Namespace
