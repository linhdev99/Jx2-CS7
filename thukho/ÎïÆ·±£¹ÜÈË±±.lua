
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��Ʒ�����˽ű�
-- Edited by peres
-- 2005/02/22 PM 18:03
-- 2005/05/17 PM 16:45

-- ======================================================

ID_ITEMBOX = 805;
function main()
  nLevel = GetLevel()
	if (GetTask(ID_ITEMBOX))==0 and  (nLevel>=10)  then
	
		Say("<color=yellow>R��ng ch�a ��<color> l� v�t kh�ng th� thi�u khi h�nh t�u giang h�. H�y ra ngo�i th�nh b�t <color=yellow>Th� x�m<color> l�y v� <color=yellow>10 c�i �u�i<color>! Ta s� gi�p ng��i l�m r��ng!",
			3,
			"Ta mu�n l�m r��ng./yes_box",
			"Kh�ng c�n ��u./no_box",
			"T�m hi�u l�i �ch r��ng ch�a ��./intro_box");
		return
	elseif (GetTask(ID_ITEMBOX))==0 and  (nLevel<10)  then
		Say("<color=yellow>R��ng ch�a ��<color> l� v�t kh�ng th� thi�u khi gia nh�p giang h�. Ng��i ch�a ��t ��n c�p 10, t�m th�i ch�a d�ng ���c! ��n <color=yellow>c�p 10<color> h�y ��n t�m ta!",0)
		return
	elseif GetTask(ID_ITEMBOX)==1 then
		check_box();
		return
 	else
	
		OpenBox()
		EnableBoxLock(1)
		SetPlayerRevivalPos(504)
		
	end;
end;


function yes_box()
	if GetTask(1) < 25 then	
		Talk(1,"","<color=green>Th� kh�<color>: Ho�n th�nh <color=yellow>nhi�m v� t�n th�<color> r�i h�n ��n t�m ta.");
		return 0;
	end;
	SetTask(ID_ITEMBOX,1);
	Say("H�y t�m <color=yellow>10 �u�i Th� x�m<color> v� cho ta!",1,"Ta �i ngay ��y!/box_no");
	TaskTip("Ra ngo�i th�nh thu th�p 10 �u�i Th� x�m �� l�m r��ng ch�a ��!")
end;

function check_box()
	if GetItemCount(2,1,2)<10 then 
		Say("Ng��i ch�a t�m ���c <color=yellow>10 �u�i Th� x�m<color> ta c�n, ta kh�ng th� gi�p ng��i l�m r��ng ch�a ��!",1,"Ta �i t�m ngay ��y!/box_no")
	else
		DelItem(2,1,2,10)
		SetTask(ID_ITEMBOX,2) --���Ŵ�������
		Say("R��ng ch�a �� �� l�m xong! Y�n t�m s� d�ng nh�!",1,"T�t l�m! Xin �a t�!/box_no")
		Msg2Player("R��ng ch�a �� �� l�m xong! Y�n t�m s� d�ng nh�!");
	end;
end;

function no_box()
end;

function intro_box()

	Say("C� th� m� r�ng kho�ng tr�ng trong r��ng ch�a �� �� c�t gi� �� v�t kh�ng th��ng d�ng v� c�c v�t ph�m qu�. Khi m� r��ng � m�t th�nh th� n�o ��, c� ngh�a l� ng��i �� c�i ��t �i�m v� th�nh t�i th�nh th� ��. Ngo�i ra, ng��i c�n b� ra <color=yellow>20 l��ng<color> s� d�ng <color=yellow>ch�c n�ng kh�a r��ng<color> �� ��m b�o an to�n cho r��ng ch�a ��. R��ng ch�a �� s� ���c h� th�ng <color=yellow>t� ��ng kh�a ch�t<color> m�i khi ng��i r�i m�ng. N�u mu�n <color=yellow>c�i ��t l�i m�t m�<color>, c�n tr� <color=yellow>th�m<color> <color=yellow>2 l��ng<color> n�a!",1,"�a t�!/no_box");
end;


