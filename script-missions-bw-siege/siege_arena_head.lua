
-- Creator : lizhi
-- ����ս��̨ 2007-3-29 10:43
-- ע��: ������̨�ͱ����ص㶼������ͬһ̨������,������군

Include("\\script\\lib\\writelog.lua");

-- ����
CITY_ID_CD = 300		-- �ɶ�
CITY_ID_QZ = 100		-- Ȫ��
CITY_ID_XY = 350		-- ����

--������ȫ�ֱ�������¼�˴β��빥��ս�ʸ��������ͣ�1��������̨ 2����Ͷ��ս��
CITY_GLB_VALUE_TYPE = 1019;

--���һ�ֻ�ù���սȨ�޵ķ���
tSignMethod = {
	"L�i ��i C�ng th�nh chi�n",
	"��u gi� khi�u chi�n l�nh",
};

tSignUpCityName =
{
	[100] = "Tuy�n Ch�u",
	[300] = "Th�nh ��",
	[200] = "Bi�n Kinh",
}

tFightCityName =
{
	[CITY_ID_CD] = "Th�nh ��",
	[CITY_ID_QZ] = "Tuy�n Ch�u",
	[CITY_ID_XY] = "T��ng D��ng",
}

-- �����ĵ�ͼID
CITY_SIGNUP_MAP_ID = 300

-- ��Ӧ������̨��ͼID
tArenaMapID =
{
	[CITY_ID_CD] = {839, 840, 841, 842},
	[CITY_ID_QZ] = {839, 840, 841, 842},
	[CITY_ID_XY] = {839, 840, 841, 842},
}

-- ���ͽ���̨������
tArenaMapPos =
{
	[839] = {1600, 3238},
	[840] = {1600, 3238},
	[841] = {1600, 3238},
	[842] = {1600, 3238},
}

-- ����������
tLeavePos = {CITY_SIGNUP_MAP_ID, 1857, 3555}

-- ��Ӧʱ�俪����̨��
tHourCity = 
{
	[19] = CITY_ID_CD,
--	[20] = CITY_ID_QZ,
--	[21] = CITY_ID_XY,
}

-- mission ID
RECORD_MISSION_ID = 37
ARENA_MISSION_ID = 38

-- timer
TIMER_ID = 66
TIME_SEC = 10
ARENA_TIME_SEC = 5
TIMER_INTERVAL = TIME_SEC * 18
ARENA_TIME_INTERVAL = ARENA_TIME_SEC * 18

RECORD_SIGNUP_TIME = 10 * 60 * 18			-- 10���ӱ���ʱ��
RECORD_RAND_TIME = 	TIMER_INTERVAL			-- 1 tick����������ʱ��(����ʱ��)
ARENA_PREPARE_TIME = 3 * 60 * 18			-- 3����׼��ʱ��
ARENA_FIGHT_TIME = 7 * 60 * 18				-- 7���ӿ���ʱ��

RECORD_SIGNUP_TIME_INTERVAL = floor(RECORD_SIGNUP_TIME / TIMER_INTERVAL)	-- ����ʱ�����
RECORD_RAND_TIME_INTERVAL = floor(RECORD_RAND_TIME / TIMER_INTERVAL)			-- ����������ʱ�����
ARENA_PREPARE_TIME_INTERVAL = floor(ARENA_PREPARE_TIME / TIMER_INTERVAL)		-- ����׼��ʱ��
ARENA_FIGHT_TIME_INTERVAL = floor(ARENA_FIGHT_TIME / TIMER_INTERVAL)			-- ����ʱ��

SUB_ARENA_PREPARE_TIME_END = floor(ARENA_PREPARE_TIME / ARENA_TIME_INTERVAL)		-- ����׼���Ľ���ʱ��
SUB_ARENA_FIGHT_TIME_END = floor(ARENA_FIGHT_TIME / ARENA_TIME_INTERVAL)			-- ����Ľ���ʱ��

MAX_TEAM_COUNT = 8							-- ���һ���ܱ����Ķ�����

-- RECORD MISSION STATE
NO_START = 0
SIGNUP_TIME = 1
VIEW_TIME = 2
PREPARE_TIME = 3
FIGHT_TIME = 4

-- CAMP ID
CAMP_FIGHT1 = 1
CAMP_FIGHT2 = 2
CAMP_VIEWER = 3

MAX_VIEWER = 20

SKILLENABLE = 1906		--�Ƿ��ܹ�ʹ���书

-- LOG
LOG_SIEGE_ERROR = 1

function LOG_SIEGE(nLogGenre, szMsg)
	if nLogGenre == LOG_SIEGE_ERROR then
		local szErrorMsg = "C�ng th�nh chi�n-L�i ��i-L�i : "..szMsg
		print(szErrorMsg)
		WriteLog(szErrorMsg)
	end
end
