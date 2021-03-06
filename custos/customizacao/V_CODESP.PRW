/*______________________________________________________________________
   �Autor     � Eraldo Drumond                       � Data � 19/04/12 �
   +----------+--------------------------------------------------------�
   �Descri��o � Fun��o de bloqueio de C�D. DE ESPESAS ref. a titulo,em:�
   �            B1_CODESP, D1_CODESP, D3_CODESP, E2_CODESP             �
  ����������������������������������������������������������������������*/
#include "rwmake.ch"

user function V_CODESP(cCodesp)

	local cAlias := Alias()
	local lRet	 := .F. 
    
	DbSelectArea('SZB')
	DbSetOrder(1)
	
	If dbSeek(xfilial('SZB')+cCodesp) 
   
		If SZB->ZB_TITULO == "2"            // nao
			lRet := .T.
		Else
			msgbox("C�d.Despesa '"+cCodesp+"' refere-se a T�tulo. Escolha outro.","Alerta","ALERT")	          
	    EndIf
	   
	Else
		msgbox("C�d.Despesa '"+cCodesp+"' n�o est� cadastrado. Favor verificar.","Alerta","ALERT")	          
	EndIf

DbSelectArea(cAlias)

return (lRet)
            
