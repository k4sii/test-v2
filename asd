#define IMGUI_DEFINE_MATH_OPERATORS

#include "imgui.h"
#include "imgui_impl_win32.h"
#include "imgui_impl_dx11.h"
#include "imgui_internal.h"
#include "imgui_freetype.h"
#include <d3d11.h>
#include <tchar.h>
#include <D3DX11tex.h>
#pragma comment(lib, "D3DX11.lib")
#include "notification.h"
#include "image.h"
#include "font.h"
#include <dwmapi.h>
#include "Memory.h"

#include "auth.hpp"
#include "anticrack.h"
Memory street;

Memory memory;

namespace pic
{

    ID3D11ShaderResourceView* aimbot = nullptr;
    ID3D11ShaderResourceView* visuals = nullptr;
    ID3D11ShaderResourceView* skins = nullptr;
    ID3D11ShaderResourceView* settings = nullptr;

    ID3D11ShaderResourceView* combo_widget = nullptr;
    ID3D11ShaderResourceView* input_widget = nullptr;

    ID3D11ShaderResourceView* menu_settings_icon = nullptr;

    ID3D11ShaderResourceView* circle_success = nullptr;
    ID3D11ShaderResourceView* circle_error = nullptr;

}

using namespace KeyAuth;
std::string name = "Panelx";
std::string ownerid = "ZGKrvKolU3";
std::string secret = "ed0b0a8d7115bec444caa41214fe9aaa6a70196243c38f1568eb3bcc3ffd30b0";
std::string version = "1.0";
std::string url = "https://keyauth.win/api/1.2/";

KeyAuth::api KeyAuthApp(name, ownerid, secret, version, url);

namespace font
{
    ImFont* inter_bold = nullptr;
    ImFont* inter_default = nullptr;
    ImFont* icon = nullptr;
}

char Username[64] = "";
char Password[64] = "";
char Key[64] = "";

static int tabs1 = 0;
static int tabs = 0;
bool authed; // nigga is not logged in

const char* cheat_name = "LEGION CHEATS SAFE";

DWORD picker_flags = ImGuiColorEditFlags_NoSidePreview | ImGuiColorEditFlags_AlphaBar | ImGuiColorEditFlags_NoInputs | ImGuiColorEditFlags_AlphaPreview;


static ID3D11Device* g_pd3dDevice = NULL;
static ID3D11DeviceContext* g_pd3dDeviceContext = NULL;
static IDXGISwapChain* g_pSwapChain = NULL;
static ID3D11RenderTargetView* g_mainRenderTargetView = NULL;

bool CreateDeviceD3D(HWND hWnd);
void CleanupDeviceD3D();
void CreateRenderTarget();
void CleanupRenderTarget();
LRESULT WINAPI WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);

int WIDTH = 960;
int HEIGHT = 610;

HWND hwnd;
RECT rc;
POINT mouse;

bool hotkeypressed1 = false;
bool hotkeypressed2 = false;
bool hotkeypressed3 = false;

static int applyfakelag;
static int applyaimbotx;
static int applyaimbotdrag;
static int applyaimbotbody;

bool AimHead, Chams3D, Awmscope, Fastswitch, aimbotbody, aimbotscope, Transparent, blue, esp, menu, Internet, magic, awmaim, restgust, arther;

namespace var
{

    bool AimHead = false;
    bool Chams3D = false;
    bool Awmscope = false;
    bool Fastswitch = false;
    bool aimbotbody = false;
    bool aimbotscope = false;
    bool applyfakelag = false;
    bool aimbotx = false;
    bool aimbotdrag = false;
    bool aimbotbody1 = false;
    bool Transparent = false;
    bool blue = false;
    bool esp = false;
    bool menu = false;
    bool Internet = false;
    bool magic = false;
    bool awmaim = false;
    bool restgust = false;
    bool arther = false;


}



static bool bAimHead = false;
static bool bChams3D = false;
static bool bAwmscope = false;
static bool bFastswitch = false;
static bool baimbotbody = false;
static bool baimbotscope = false;
static bool bapplyfakelag = false;
static bool aimbotx = false;
static bool aimbotdrag = false;
static bool baimbotbody1 = false;
static bool bmagic = false;
static bool bawmaim = false;
static bool brestgust = false;
static bool barther = false;

static float text_animation = 0.00f;
static bool text_animation_hide = true;
static float loader_animation = 0.f;


bool info_bar = true;



const char* rafapanelnm = "LEGION CHEATS SAFE";
//const char* cheat_name1 = "";
const char* rafapanelnm1 = "";


const char* game_status = "FREE FIRE";
const char* developer = "K4sii";

const char* ping = "7ms";
const char* world_time = "12:20am";

static bool particle = true;


namespace ImGui
{
    int rotation_start_index;
    void ImRotateStart()
    {
        rotation_start_index = ImGui::GetWindowDrawList()->VtxBuffer.Size;
    }

    ImVec2 ImRotationCenter()
    {
        ImVec2 l(FLT_MAX, FLT_MAX), u(-FLT_MAX, -FLT_MAX); // bounds

        const auto& buf = ImGui::GetWindowDrawList()->VtxBuffer;
        for (int i = rotation_start_index; i < buf.Size; i++)
            l = ImMin(l, buf[i].pos), u = ImMax(u, buf[i].pos);

        return ImVec2((l.x + u.x) / 2, (l.y + u.y) / 2); // or use _ClipRectStack?
    }


    void ImRotateEnd(float rad, ImVec2 center = ImRotationCenter())
    {
        float s = sin(rad), c = cos(rad);
        center = ImRotate(center, s, c) - center;

        auto& buf = ImGui::GetWindowDrawList()->VtxBuffer;
        for (int i = rotation_start_index; i < buf.Size; i++)
            buf[i].pos = ImRotate(buf[i].pos, s, c) - center;
    }
}


void Particles()
{

    ImVec2 screen_size = { (float)GetSystemMetrics(SM_CXSCREEN), (float)GetSystemMetrics(SM_CYSCREEN) };

    static ImVec2 partile_pos[100];
    static ImVec2 partile_target_pos[100];
    static float partile_speed[100];
    static float partile_size[100];
    static float partile_radius[100];
    static float partile_rotate[100];

    for (int i = 1; i < 70; i++)
    {
        if (partile_pos[i].x == 0 || partile_pos[i].y == 0)
        {
            partile_pos[i].x = rand() % (int)screen_size.x + 1;
            partile_pos[i].y = 15.f;
            partile_speed[i] = 1 + rand() % 35;
            partile_radius[i] = rand() % 4;
            partile_size[i] = rand() % 8;

            partile_target_pos[i].x = rand() % (int)screen_size.x;
            partile_target_pos[i].y = screen_size.y * 2;
        }

        partile_pos[i] = ImLerp(partile_pos[i], partile_target_pos[i], ImGui::GetIO().DeltaTime * (partile_speed[i] / 60));
        partile_rotate[i] += ImGui::GetIO().DeltaTime;

        if (partile_pos[i].y > screen_size.y)
        {
            partile_pos[i].x = 0;
            partile_pos[i].y = 0;
            partile_rotate[i] = 0;
        }

        ImGui::ImRotateStart();
        ImGui::GetWindowDrawList()->AddCircleFilled(partile_pos[i], partile_size[i], ImGui::GetColorU32(c::accent), 1);
        ImGui::GetWindowDrawList()->AddShadowCircle(partile_pos[i], 8.f, ImGui::GetColorU32(c::accent), 58.f + partile_size[i], ImVec2(0, 0), 0, 1);
        ImGui::ImRotateEnd(partile_rotate[i]);
    }
}

int Getid(const char* procnname) {

    if (procnname == NULL)
        return 0;
    DWORD pid = 0;
    DWORD threadCount = 0;

    HANDLE hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    PROCESSENTRY32 pe;

    pe.dwSize = sizeof(PROCESSENTRY32);
    Process32First(hSnap, &pe);
    while (Process32Next(hSnap, &pe)) {
        if (_tcsicmp(pe.szExeFile, procnname) == 0) {
            if ((int)pe.cntThreads > threadCount) {
                threadCount = pe.cntThreads;

                pid = pe.th32ProcessID;

            }
        }
    }
    return pid;
}

auto body() -> void {
    static bool Status = false;
    while (true)
    {
        if (baimbotbody)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;

            std::vector<BYTE> scanpattern = { 0xDC, 0x52, 0x39, 0xBD, 0x27, 0xC1, 0x8B, 0x3C, 0xC0, 0xD0, 0xF8, 0xB9 };
            std::vector<BYTE> replacepattern = { 0x00, 0x00, 0x00, 0x3E, 0x0A, 0xD7, 0x23, 0x3D, 0xD2, 0xA5, 0xF9, 0xBC };

            std::vector<BYTE> scanpattern1 = { 0x63, 0x71, 0xB0, 0xBD, 0x90, 0x98, 0x74, 0xBB, 0x00, 0x00, 0x80, 0xB3 };
            std::vector<BYTE> replacepattern1 = { 0xCD, 0xDC, 0x79, 0x44, 0x90, 0x98, 0x74, 0xBB, 0x00, 0x00, 0x80, 0xB3 };

            std::vector<BYTE> scanpattern2 = { 0x7B, 0xF9, 0x6C, 0xBD, 0x58, 0x34, 0x09, 0xBB, 0xB0, 0x60, 0xBE, 0xBA };
            std::vector<BYTE> replacepattern2 = { 0xCD, 0xDC, 0x79, 0x44, 0x58, 0x34, 0x09, 0xBB, 0xB0, 0x60, 0xBE, 0xBA };

            std::vector<BYTE> scanpattern3 = { 0x54, 0x1B, 0x87, 0xBD, 0x90, 0xC6, 0xD7, 0xBA, 0x80, 0x54, 0x99, 0xB9 };
            std::vector<BYTE> replacepattern3 = { 0xCD, 0xDC, 0x79, 0x44, 0x90, 0xC6, 0xD7, 0xBA, 0x80, 0x54, 0x99, 0xB9 };

            std::vector<BYTE> scanpattern4 = { 0x71, 0x02, 0x87, 0xBD, 0x90, 0xFD, 0xD7, 0xBA, 0x40, 0x18, 0x98, 0x39 };
            std::vector<BYTE> replacepattern4 = { 0xCD, 0xDC, 0x79, 0x44, 0x90, 0xFD, 0xD7, 0xBA, 0x40, 0x18, 0x98, 0x39 };

            std::vector<BYTE> scanpattern5 = { 0xCC, 0xF8, 0x6C, 0xBD, 0x40, 0xD2, 0xCE, 0xB9, 0x58, 0x64, 0xBE, 0x3A };
            std::vector<BYTE> replacepattern5 = { 0xCD, 0xDC, 0x79, 0x44, 0x40, 0xD2, 0xCE, 0xB9, 0x58, 0x64, 0xBE, 0x3A };


            std::vector<BYTE> scanpattern6 = { 0x76, 0xFC, 0xDB, 0xBC, 0x7C, 0x5E, 0x8B, 0x3A, 0x50, 0x8B, 0xBB, 0x3A };
            std::vector<BYTE> replacepattern6 = { 0xCD, 0xDC, 0x79, 0x44, 0x7C, 0x5E, 0x8B, 0x3A, 0x50, 0x8B, 0xBB, 0x3A };

            std::vector<BYTE> scanpattern7 = { 0x80, 0x13, 0x95, 0xBC, 0x30, 0xFF, 0x37, 0xBB, 0x00, 0xFD, 0x78, 0x3B };
            std::vector<BYTE> replacepattern7 = { 0xCD, 0xDC, 0x79, 0x44, 0x30, 0xFF, 0x37, 0xBB, 0x00, 0xFD, 0x78, 0x3B };

            std::vector<BYTE> scanpattern8 = { 0x1F, 0x93, 0xDB, 0xBC, 0x90, 0xBF, 0x84, 0x3A, 0x20, 0xA6, 0xBB, 0xBA };
            std::vector<BYTE> replacepattern8 = { 0xCD, 0xDC, 0x79, 0x44, 0x90, 0xBF, 0x84, 0x3A, 0x20, 0xA6, 0xBB, 0xBA };

            std::vector<BYTE> scanpattern9 = { 0xEF, 0xA3, 0x00, 0xBE, 0x40, 0xB9, 0x92, 0x39, 0x20, 0x4E, 0x07, 0xBA };
            std::vector<BYTE> replacepattern9 = { 0xCD, 0xDC, 0x79, 0x44, 0x40, 0xB9, 0x92, 0x39, 0x20, 0x4E, 0x07, 0xBA };

            std::vector<BYTE> scanpattern10 = { 0xBC, 0x19, 0xFD, 0xBD, 0xB0, 0xE3, 0xA9, 0x3A, 0x80, 0x42, 0x23, 0xB9 };
            std::vector<BYTE> replacepattern10 = { 0xCD, 0xDC, 0x79, 0x44, 0xB0, 0xE3, 0xA9, 0x3A, 0x80, 0x42, 0x23, 0xB9 };






            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
      


            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Aimbot Body!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }

            baimbotbody = 1;
            Sleep(1);
            baimbotbody = false;
        }

        Sleep(1);
    }
}

auto fswitch() -> void {
    static bool Status = false;
    while (true)
    {
        if (bFastswitch)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;


            std::vector<BYTE> scanpattern2 = { };
            std::vector<BYTE> replacepattern2 = { };

            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern2.data(), replacepattern2.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Quick Switch!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }

            bFastswitch = 1;
            Sleep(1);
            bFastswitch = false;
        }

        Sleep(1);
    }
}

auto awmscope() -> void {
    static bool Status = false;
    while (true)
    {
        if (bAwmscope)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;


            std::vector<BYTE> scanpattern2 = { };
            std::vector<BYTE> replacepattern2 = {  };

            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern2.data(), replacepattern2.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Awm Scope!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }

            bAwmscope = 1;
            Sleep(1);
            bAwmscope = false;
        }

        Sleep(1);
    }
}

auto aimboscope() -> void {
    static bool Status = false;
    while (true)
    {
        if (baimbotscope)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;


            std::vector<BYTE> scanpattern2 = {  };
            std::vector<BYTE> replacepattern2 = { };

            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern2.data(), replacepattern2.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Aimbot Scope!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }

            baimbotscope = 1;
            Sleep(1);
            baimbotscope = false;
        }

        Sleep(1);
    }
}

auto bodykey() -> void {
    static bool Status = false;
    while (true)
    {
        if (baimbotbody1)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;


            std::vector<BYTE> scanpattern = { 0xDC, 0x52, 0x39, 0xBD, 0x27, 0xC1, 0x8B, 0x3C, 0xC0, 0xD0, 0xF8, 0xB9 };
            std::vector<BYTE> replacepattern = { 0x00, 0x00, 0x00, 0x3E, 0x0A, 0xD7, 0x23, 0x3D, 0xD2, 0xA5, 0xF9, 0xBC };

            std::vector<BYTE> scanpattern1 = { 0x63, 0x71, 0xB0, 0xBD, 0x90, 0x98, 0x74, 0xBB, 0x00, 0x00, 0x80, 0xB3 };
            std::vector<BYTE> replacepattern1 = { 0xCD, 0xDC, 0x79, 0x44, 0x90, 0x98, 0x74, 0xBB, 0x00, 0x00, 0x80, 0xB3 };

            std::vector<BYTE> scanpattern2 = { 0x7B, 0xF9, 0x6C, 0xBD, 0x58, 0x34, 0x09, 0xBB, 0xB0, 0x60, 0xBE, 0xBA };
            std::vector<BYTE> replacepattern2 = { 0xCD, 0xDC, 0x79, 0x44, 0x58, 0x34, 0x09, 0xBB, 0xB0, 0x60, 0xBE, 0xBA };

            std::vector<BYTE> scanpattern3 = { 0x54, 0x1B, 0x87, 0xBD, 0x90, 0xC6, 0xD7, 0xBA, 0x80, 0x54, 0x99, 0xB9 };
            std::vector<BYTE> replacepattern3 = { 0xCD, 0xDC, 0x79, 0x44, 0x90, 0xC6, 0xD7, 0xBA, 0x80, 0x54, 0x99, 0xB9 };

            std::vector<BYTE> scanpattern4 = { 0x71, 0x02, 0x87, 0xBD, 0x90, 0xFD, 0xD7, 0xBA, 0x40, 0x18, 0x98, 0x39 };
            std::vector<BYTE> replacepattern4 = { 0xCD, 0xDC, 0x79, 0x44, 0x90, 0xFD, 0xD7, 0xBA, 0x40, 0x18, 0x98, 0x39 };

            std::vector<BYTE> scanpattern5 = { 0xCC, 0xF8, 0x6C, 0xBD, 0x40, 0xD2, 0xCE, 0xB9, 0x58, 0x64, 0xBE, 0x3A };
            std::vector<BYTE> replacepattern5 = { 0xCD, 0xDC, 0x79, 0x44, 0x40, 0xD2, 0xCE, 0xB9, 0x58, 0x64, 0xBE, 0x3A };


            std::vector<BYTE> scanpattern6 = { 0x76, 0xFC, 0xDB, 0xBC, 0x7C, 0x5E, 0x8B, 0x3A, 0x50, 0x8B, 0xBB, 0x3A };
            std::vector<BYTE> replacepattern6 = { 0xCD, 0xDC, 0x79, 0x44, 0x7C, 0x5E, 0x8B, 0x3A, 0x50, 0x8B, 0xBB, 0x3A };

            std::vector<BYTE> scanpattern7 = { 0x80, 0x13, 0x95, 0xBC, 0x30, 0xFF, 0x37, 0xBB, 0x00, 0xFD, 0x78, 0x3B };
            std::vector<BYTE> replacepattern7 = { 0xCD, 0xDC, 0x79, 0x44, 0x30, 0xFF, 0x37, 0xBB, 0x00, 0xFD, 0x78, 0x3B };

            std::vector<BYTE> scanpattern8 = { 0x1F, 0x93, 0xDB, 0xBC, 0x90, 0xBF, 0x84, 0x3A, 0x20, 0xA6, 0xBB, 0xBA };
            std::vector<BYTE> replacepattern8 = { 0xCD, 0xDC, 0x79, 0x44, 0x90, 0xBF, 0x84, 0x3A, 0x20, 0xA6, 0xBB, 0xBA };

            std::vector<BYTE> scanpattern9 = { 0xEF, 0xA3, 0x00, 0xBE, 0x40, 0xB9, 0x92, 0x39, 0x20, 0x4E, 0x07, 0xBA };
            std::vector<BYTE> replacepattern9 = { 0xCD, 0xDC, 0x79, 0x44, 0x40, 0xB9, 0x92, 0x39, 0x20, 0x4E, 0x07, 0xBA };

            std::vector<BYTE> scanpattern10 = { 0xBC, 0x19, 0xFD, 0xBD, 0xB0, 0xE3, 0xA9, 0x3A, 0x80, 0x42, 0x23, 0xB9 };
            std::vector<BYTE> replacepattern10 = { 0xCD, 0xDC, 0x79, 0x44, 0xB0, 0xE3, 0xA9, 0x3A, 0x80, 0x42, 0x23, 0xB9 };

   



            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());

            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());

            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());

            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern.data(), replacepattern.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Aimbot Body!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }


            baimbotbody1 = 1;
            Sleep(1);
            baimbotbody1 = false;
        }

        Sleep(1);
    }
}


auto magic1() -> void {
    static bool Status = false;
    while (true)
    {
        if (bmagic)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;


            std::vector<BYTE> scanpattern2 = { };
            std::vector<BYTE> replacepattern2 = {  };

            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern2.data(), replacepattern2.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Magic Bullet V1!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }

            bmagic = 1;
            Sleep(1);
            bmagic = false;
        }

        Sleep(1);
    }
}

auto awmaim1() -> void {
    static bool Status = false;
    while (true)
    {
        if (bawmaim)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;


            std::vector<BYTE> scanpattern2 = { };
            std::vector<BYTE> replacepattern2 = {  };

            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern2.data(), replacepattern2.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Awm Aim!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }

            bawmaim = 1;
            Sleep(1);
            bawmaim = false;
        }

        Sleep(1);
    }
}

auto restgust1() -> void {
    static bool Status = false;
    while (true)
    {
        if (brestgust)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;


            std::vector<BYTE> scanpattern2 = { };
            std::vector<BYTE> replacepattern2 = {  };

            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern2.data(), replacepattern2.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Reset Guest!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }

            brestgust = 1;
            Sleep(1);
            brestgust = false;
        }

        Sleep(1);
    }
}

auto remove1() -> void {
    static bool Status = false;
    while (true)
    {
        if (barther)
        {

            SYSTEM_INFO si;
            GetSystemInfo(&si);

            DWORD_PTR SAddress = (DWORD_PTR)si.lpMinimumApplicationAddress;
            DWORD_PTR EAddress = (DWORD_PTR)si.lpMaximumApplicationAddress;


            std::vector<BYTE> scanpattern2 = {  };
            std::vector<BYTE> replacepattern2 = {  };

            bool st = street.ReplacePattern(SAddress, EAddress, scanpattern2.data(), replacepattern2.data());
            if (st)
            {
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Remove Magic!" });

            }
            else
            {
                ImGui::Notification({ ImGuiToastType_Error, 4000, "Emulator Not Running!" });

            }

            barther = 1;
            Sleep(1);
            barther = false;
        }

        Sleep(1);
    }
}

int APIENTRY WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{

    street.AttackProcess(street.GetEmulatorRunning());
    if (!street.AttackProcess(street.GetEmulatorRunning()))
    {
        ImGui::Notification({ ImGuiToastType_Error, 4000, "No Process Found!" });
    }


    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)body, nullptr, NULL, nullptr);
    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)fswitch, nullptr, NULL, nullptr);
    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)awmscope, nullptr, NULL, nullptr);
    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)aimboscope, nullptr, NULL, nullptr);
    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)bodykey, nullptr, NULL, nullptr);
    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)magic1, nullptr, NULL, nullptr);
    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)awmaim1, nullptr, NULL, nullptr);
    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)restgust1, nullptr, NULL, nullptr);
    CreateThread(nullptr, NULL, (LPTHREAD_START_ROUTINE)remove1, nullptr, NULL, nullptr);

    bool isProcessFrozen = false;
    KeyAuthApp.init();

    if (!KeyAuthApp.data.success)
    {
        MessageBoxA(NULL,"Couldnt Connect To KeyAuth!", NULL, NULL);
        Sleep(1500);
        exit(0);
    }

    WNDCLASSEXW wc;
    wc.cbSize = sizeof(WNDCLASSEXW);
    wc.style = CS_CLASSDC;
    wc.lpfnWndProc = WndProc;
    wc.cbClsExtra = NULL;
    wc.cbWndExtra = NULL;
    wc.hInstance = nullptr;
    wc.hIcon = LoadIcon(0, IDI_APPLICATION);
    wc.hCursor = LoadCursor(0, IDC_ARROW);
    wc.hbrBackground = nullptr;
    wc.lpszMenuName = L"LEGION CHEATS SAFE ";
    wc.lpszClassName = L"LEGION CHEATS SAFE ";
    wc.hIconSm = LoadIcon(0, IDI_APPLICATION);

    RegisterClassExW(&wc);
    HWND hwnd = CreateWindowExW(NULL, wc.lpszClassName, L"LEGION CHEATS SAFE ", WS_POPUP, (GetSystemMetrics(SM_CXSCREEN) / 2) - (WIDTH / 2), (GetSystemMetrics(SM_CYSCREEN) / 2) - (HEIGHT / 2), WIDTH, HEIGHT, 0, 0, 0, 0);

    SetWindowLongA(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) | WS_EX_LAYERED);
    SetLayeredWindowAttributes(hwnd, RGB(0, 0, 0), 255, LWA_ALPHA);
    MARGINS margins = { -1 };
    DwmExtendFrameIntoClientArea(hwnd, &margins);

    POINT mouse;
    RECT rc = { 0 };
    GetWindowRect(hwnd, &rc);

    if (!CreateDeviceD3D(hwnd))
    {
        CleanupDeviceD3D();
        ::UnregisterClassW(wc.lpszClassName, wc.hInstance);
        return 1;
    }

    ::ShowWindow(hwnd, SW_SHOWDEFAULT);
    ::UpdateWindow(hwnd);

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;  
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad;   

    ImFontConfig cfg;
    cfg.FontBuilderFlags = ImGuiFreeTypeBuilderFlags_ForceAutoHint | ImGuiFreeTypeBuilderFlags_LightHinting | ImGuiFreeTypeBuilderFlags_LoadColor;

    font::inter_default = io.Fonts->AddFontFromMemoryTTF(inter_medium, sizeof(inter_medium), 17.f, &cfg, io.Fonts->GetGlyphRangesCyrillic());
    font::inter_bold = io.Fonts->AddFontFromMemoryTTF(inter_bold, sizeof(inter_bold), 17.f, &cfg, io.Fonts->GetGlyphRangesCyrillic());
    font::icon = io.Fonts->AddFontFromMemoryTTF(icon_font, sizeof(icon_font), 15.f, &cfg, io.Fonts->GetGlyphRangesCyrillic());

    ImGui::StyleColorsDark();

    D3DX11_IMAGE_LOAD_INFO info; ID3DX11ThreadPump* pump{ nullptr };

    if (pic::aimbot == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, aimbot, sizeof(aimbot), &info, pump, &pic::aimbot, 0);
    if (pic::visuals == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, visuals, sizeof(visuals), &info, pump, &pic::visuals, 0);
    if (pic::skins == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, skins, sizeof(skins), &info, pump, &pic::skins, 0);
    if (pic::settings == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, settings, sizeof(settings), &info, pump, &pic::settings, 0);

    if (pic::combo_widget == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, combo_widget, sizeof(combo_widget), &info, pump, &pic::combo_widget, 0);
    if (pic::input_widget == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, input_widget, sizeof(input_widget), &info, pump, &pic::input_widget, 0);

    if (pic::menu_settings_icon == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, menu_settings_icon, sizeof(menu_settings_icon), &info, pump, &pic::menu_settings_icon, 0);

    if (pic::circle_success == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, circle_success, sizeof(circle_success), &info, pump, &pic::circle_success, 0);
    if (pic::circle_error == nullptr) D3DX11CreateShaderResourceViewFromMemory(g_pd3dDevice, circle_error, sizeof(circle_error), &info, pump, &pic::circle_error, 0);


    ImGui_ImplWin32_Init(hwnd);
    ImGui_ImplDX11_Init(g_pd3dDevice, g_pd3dDeviceContext);

    bool show_another_window = false;
    ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);

    bool done = false;
    while (!done)
    {

        MSG msg;
        while (::PeekMessage(&msg, nullptr, 0U, 0U, PM_REMOVE))
        {
            ::TranslateMessage(&msg);
            ::DispatchMessage(&msg);
            if (msg.message == WM_QUIT)
                done = true;
        }
        if (done)
            break;

        ImGui_ImplDX11_NewFrame();
        ImGui_ImplWin32_NewFrame();
        ImGui::NewFrame();
        {
            ImGuiStyle* style = &ImGui::GetStyle();

            style->WindowPadding = ImVec2(0, 0);
            style->WindowBorderSize = 0;
            style->ItemSpacing = ImVec2(20, 20);
            style->ScrollbarSize = 8.f;

            static float color[4] = { 1.f, 0.f, 0.f, 1.f };
            c::accent = { color[0], color[1], color[2], 1.f };

            ImGui::SetNextWindowSize(ImVec2(WIDTH, HEIGHT));
            ImGui::Begin("Menu", nullptr, ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoBringToFrontOnFocus | ImGuiWindowFlags_NoBackground | ImGuiWindowFlags_NoBringToFrontOnFocus | ImGuiWindowFlags_NoScrollWithMouse);
            {
                Particles();

                auto draw = ImGui::GetWindowDrawList();
                const auto& p = ImGui::GetWindowPos();

                GetWindowRect(hwnd, &rc);

                if (ImGui::GetWindowPos().x != 0 || ImGui::GetWindowPos().y != 0)
                {
                    MoveWindow(hwnd, rc.left + ImGui::GetWindowPos().x, rc.top + ImGui::GetWindowPos().y, WIDTH, HEIGHT, TRUE);
                    ImGui::SetWindowPos(ImVec2(0.f, 0.f));
                }

                const ImVec2& pos = ImGui::GetWindowPos();
                const ImVec2& spacing = style->ItemSpacing;
                const ImVec2& region = ImGui::GetContentRegionMax();

                ImGui::GetBackgroundDrawList()->AddRectFilled(pos, pos + region, ImGui::GetColorU32(c::bg::background), c::bg::rounding);

                ImVec2 new_pos(pos.x - 765, pos.y + 335);

                float border_thickness = 3.0f;
                float rounding = 5.0f;
                ImVec2 min = ImGui::GetWindowPos();
                ImVec2 max = ImGui::GetWindowPos() + ImGui::GetWindowSize();
                ImU32 border_color = ImGui::GetColorU32(c::accent);
                ImGui::GetWindowDrawList()->AddRect(min, max, border_color, rounding, ImDrawCornerFlags_All, border_thickness);
                ImGui::SetCursorPos(ImVec2(240, 172 + spacing.y) + spacing);

                if (!authed) {

                    ImGui::BeginGroup();
                    {
                        ImGui::BeginChild("GREATXCHEAT");
                        {
                            ImGui::InputTextEx("Username#01", "Username", Username, 64, ImVec2(500 - style->WindowPadding.x, 40), false);
                            ImGui::InputTextEx("Password#01", "Password", Password, 64, ImVec2(500 - style->WindowPadding.x, 40), false);
                            ImGui::InputTextEx("Key#01", "Key", Key, 64, ImVec2(500 - style->WindowPadding.x, 40), false);

                            if (ImGui::Button("Login", ImVec2(500, 40)))
                            {
                                KeyAuthApp.login(Username, Password);
                                if (KeyAuthApp.data.success)
                                {
                                    ImGui::Notification({ ImGuiToastType_Success, 4000, "Logged In! Welcome LEGION CHEATS SAFE" });
                                    authed = true;
                                }
                                else
                                {
                                    MessageBoxA(NULL, KeyAuthApp.data.message.c_str(), NULL, NULL);
                                }
                            };

                            const ImVec2& region = ImGui::GetContentRegionMax();
                            ImGui::GetBackgroundDrawList()->AddRectFilled(pos, pos + region, ImGui::GetColorU32(c::bg::background), c::bg::rounding);
                            ImGui::GlowText(font::inter_bold, 17.f, rafapanelnm1, pos + (ImVec2(1660, 1102 + spacing.y) + spacing - ImGui::CalcTextSize(rafapanelnm1)) / 2, ImGui::GetColorU32(c::accent));

                            static bool tab_changer = false;
                            if (GetAsyncKeyState(VK_INSERT) & 0x01) tab_changer = !tab_changer;

                            ImGuiStyle& style = ImGui::GetStyle();



                            if (ImGui::Button("Register", ImVec2(500, 40)))
                            {
                                KeyAuthApp.regstr(Username, Password, Key);
                                if (KeyAuthApp.data.success)
                                {
                                    ImGui::Notification({ ImGuiToastType_Success, 4000, "Logged In! Welcome" });
                                    authed = true;
                                }
                                else
                                {
                                    MessageBoxA(NULL, KeyAuthApp.data.message.c_str(), NULL, NULL);
                                }
                            };

                        }

                        ImGui::EndChild();
                    }

                    ImGui::EndGroup();
                }
            }

            if (authed)
            {

                //ImGui::SetCursorPos(ImVec2(15, 15));
                //if (ImGui::TextButton("E", ImVec2(25, 25))) tabs = 0;

                GetWindowRect(hwnd, &rc);

                if (ImGui::GetWindowPos().x != 0 || ImGui::GetWindowPos().y != 0)
                {
                    MoveWindow(hwnd, rc.left + ImGui::GetWindowPos().x, rc.top + ImGui::GetWindowPos().y, WIDTH, HEIGHT, TRUE);
                    ImGui::SetWindowPos(ImVec2(0.f, 0.f));
                }

                ImGui::SetCursorPos({ 590, 580 });
                ImGui::TextColored(ImVec4(255 / 255.f, 255 / 255.f, 255 / 255.f, 255 / 255.f), "                                                                  Dev:St2kangry");

                const ImVec2& pos = ImGui::GetWindowPos();
                const ImVec2& spacing = style->ItemSpacing;
                const ImVec2& region = ImGui::GetContentRegionMax();

                ImGui::GetBackgroundDrawList()->AddRectFilled(pos, pos + region, ImGui::GetColorU32(c::bg::background), c::bg::rounding);

                ImVec2 new_pos(pos.x - 765, pos.y + 335);

                float border_thickness = 3.0f;
                float rounding = 5.0f;
                ImVec2 min = ImGui::GetWindowPos();
                ImVec2 max = ImGui::GetWindowPos() + ImGui::GetWindowSize();
                ImU32 border_color = ImGui::GetColorU32(c::accent);
                ImGui::GetWindowDrawList()->AddRect(min, max, border_color, rounding, ImDrawCornerFlags_All, border_thickness);
                ImGui::SetCursorPos(ImVec2(240, 172 + spacing.y) + spacing);

                ImGui::GetBackgroundDrawList()->AddRectFilled(pos, pos + region, ImGui::GetColorU32(c::bg::background), c::bg::rounding);

                ImGui::GetBackgroundDrawList()->AddRectFilled(pos + spacing, pos + ImVec2(180, 62 + +spacing.y), ImGui::GetColorU32(c::child::background), c::child::rounding);
                ImGui::GetBackgroundDrawList()->AddRect(pos + spacing, pos + ImVec2(180, 62 + spacing.y), ImGui::GetColorU32(c::child::outline), c::child::rounding);

                ImGui::GetBackgroundDrawList()->AddRectFilled(pos + ImVec2(0, 62 + spacing.y) + spacing, pos + ImVec2(180, region.y - spacing.y), ImGui::GetColorU32(c::child::background), c::child::rounding);
                ImGui::GetBackgroundDrawList()->AddRect(pos + ImVec2(0, 62 + spacing.y) + spacing, pos + ImVec2(180, region.y - spacing.y), ImGui::GetColorU32(c::child::outline), c::child::rounding);

                ImGui::GetBackgroundDrawList()->AddRectFilled(pos + ImVec2(180, 0) + spacing, pos + ImVec2(region.x - (spacing.x * 2) - 62, 62 + spacing.y), ImGui::GetColorU32(c::child::background), c::child::rounding);
                ImGui::GetBackgroundDrawList()->AddRect(pos + ImVec2(180, 0) + spacing, pos + ImVec2(region.x - (spacing.x * 2) - 62, 62 + spacing.y), ImGui::GetColorU32(c::child::outline), c::child::rounding);

                ImGui::GetBackgroundDrawList()->AddRectFilled(pos + ImVec2(region.x - (spacing.x * 2) - 62, 0) + spacing, pos + ImVec2(region.x - spacing.x, 62 + spacing.y), ImGui::GetColorU32(c::child::background), c::child::rounding);
                ImGui::GetBackgroundDrawList()->AddRect(pos + ImVec2(region.x - (spacing.x * 2) - 62, 0) + spacing, pos + ImVec2(region.x - spacing.x, 62 + spacing.y), ImGui::GetColorU32(c::child::outline), c::child::rounding);

                ImGui::GetWindowDrawList()->AddImage(pic::menu_settings_icon, pos + ImVec2(region.x - (spacing.x * 2) - 62, 0) + spacing + ImVec2(16, 16), pos + ImVec2(region.x - spacing.x, 62 + spacing.y) - ImVec2(16, 16), ImVec2(0, 0), ImVec2(1, 1), ImGui::GetColorU32(c::accent));

                ImGui::GlowText(font::inter_bold, 17.f, rafapanelnm, pos + (ImVec2(180, 62 + spacing.y) + spacing - ImGui::CalcTextSize(rafapanelnm)) / 2, ImGui::GetColorU32(c::accent)); // nombre panel

                ImGui::GlowText(font::inter_bold, 17.f, rafapanelnm, pos + (ImVec2(180, 62 + spacing.y) + spacing - ImGui::CalcTextSize(rafapanelnm)) / 2, ImGui::GetColorU32(c::accent)); // nombre panel

                static int tabs1 = 0, sub_tabs = 0;

                ImGui::SetCursorPos(ImVec2(spacing.x * 2, 62 + spacing.y * 3));
                ImGui::BeginGroup();
                {
                    if (ImGui::Tabs(0 == tabs1, pic::aimbot, "Aimbot", ImVec2(180 - spacing.x * 3, 35), NULL)) tabs1 = 0;
                }
                ImGui::EndGroup();

                ImGui::SetCursorPos(ImVec2(180 + spacing.x, spacing.y));
                ImGui::BeginGroup();
                {
                    if (ImGui::SubTab(0 == sub_tabs, "EXTERNAL", ImVec2(80, 62))) sub_tabs = 0;
                    ImGui::SameLine(0, 5);

                }
                ImGui::EndGroup();

                ImGui::SetCursorPos(ImVec2(180, 62 + spacing.y) + spacing);

                ImGui::BeginGroup();
                {
                    ImGui::CustomBeginChild("AIMBOT", ImVec2((region.x - (spacing.x * 3 + 180)) / 2, (region.y - (spacing.y * 4 + 62)) / 2.0f + 40));
                    {
                        static int key = 0, m = 0;
                        ImGui::Keybind("Aimbot Pro Key Head", &applyaimbotx, &m, true);
                        if (GetAsyncKeyState(applyaimbotx) & 1)
                        {
                            if (!hotkeypressed1)
                            {
                                hotkeypressed1 = true;


                                var::aimbotx = !var::aimbotx;

                                if (var::aimbotx)
                                {
                                    std::thread taskThread([]()
                                        {

                                            memory.EnableAimkeyhead();
                                        });
                                    taskThread.detach();
                                }
                                else {
                                    std::thread taskThread([]()
                                        {

                                            memory.EnableAimkeyhead();
                                        });
                                    taskThread.detach();
                                }
                            }
                            else
                            {
                                hotkeypressed1 = false;
                            }
                        }

                        ImGui::Keybind("Aimbot Drag Key", &applyaimbotdrag, &m, true);
                        if (GetAsyncKeyState(applyaimbotdrag) & 1)
                        {
                            if (!hotkeypressed2)
                            {
                                hotkeypressed2 = true;


                                var::aimbotdrag = !var::aimbotdrag;

                                if (var::aimbotdrag)
                                {
                                    std::thread taskThread([]()
                                        {

                                            memory.EnableAimdragkey();
                                        });
                                    taskThread.detach();
                                }
                                else {
                                    std::thread taskThread([]()
                                        {

                                            memory.EnableAimdragkey();
                                        });
                                    taskThread.detach();
                                }
                            }
                            else
                            {
                                hotkeypressed2 = false;
                            }
                        }

                        ImGui::Keybind("Aimbot Body Key", &applyaimbotbody, &m, true);
                        if (GetAsyncKeyState(applyaimbotbody) & 1)
                        {
                            if (!hotkeypressed3)
                            {
                                hotkeypressed3 = true;


                                var::aimbotbody1 = !var::aimbotbody1;

                                if (var::aimbotbody1)
                                {
                                    std::thread taskThread([]()
                                        {

                                            baimbotbody1 = true;
                                        });
                                    taskThread.detach();
                                }
                                else {
                                    std::thread taskThread([]()
                                        {

                                            baimbotbody1 = true;
                                        });
                                    taskThread.detach();
                                }
                            }
                            else
                            {
                                hotkeypressed3 = false;
                            }
                        }

                        static float color[4] = { 0.f, 1.f, 0.f, 1.f };
                        AimHead = ImGui::Checkbox("Aimbot Pro Head ", &var::AimHead);

                        Chams3D = ImGui::Checkbox("Aimbot Drag", &var::Chams3D);

                        aimbotbody = ImGui::Checkbox("Aimbot Body", &var::aimbotbody);
                    }
                    ImGui::CustomEndChild();

                    ImGui::CustomBeginChild("CHAMS", ImVec2((region.x - (spacing.x * 3 + 180)) / 2, (region.y - (spacing.y * 4 + 62)) / 2.0f - 40));
                    {

                        Transparent = ImGui::Checkbox("Transparent", &var::Transparent);

                        blue = ImGui::Checkbox("Blue", &var::blue);

                        esp = ImGui::Checkbox("Esp", &var::esp);

                        menu = ImGui::Checkbox("Mode Menu", &var::menu);

                    }
                    ImGui::CustomEndChild();
                }
                ImGui::EndGroup();

                ImGui::SameLine();

                ImGui::BeginGroup();
                {
                    ImGui::CustomBeginChild("SNIPER MODE", ImVec2((region.x - (spacing.x * 3 + 180)) / 2, (region.y - (spacing.y * 4 + 62)) / 2.0f - 40));
                    {

                        static float color[4] = { 0.f, 1.f, 0.f, 1.f };
                        Awmscope = ImGui::Checkbox("Awm Scope", &var::Awmscope);

                        awmaim = ImGui::Checkbox("Awm Aim - Y", &var::awmaim);

                        Fastswitch = ImGui::Checkbox("Quick Switch", &var::Fastswitch);

                        aimbotscope = ImGui::Checkbox("Aimbot Scope X4", &var::aimbotscope);

                        magic = ImGui::Checkbox("Magic Bullet V1", &var::magic);

                    }
                    ImGui::CustomEndChild();

                    ImGui::CustomBeginChild("SETTINGS", ImVec2((region.x - (spacing.x * 3 + 180)) / 2, (region.y - (spacing.y * 10 + 62)) / 2.0f + 40));
                    {

                        Internet = ImGui::Checkbox("Block & Unblock Internet", &var::Internet);

                        restgust = ImGui::Checkbox("Reset Guest", &var::restgust);

                        arther = ImGui::Checkbox("Remove Magic", &var::arther);

                        ImGui::ColorEdit4("Color Picker", color, picker_flags);

                    }
                    ImGui::CustomEndChild();
                }
                ImGui::EndGroup();

            }
            ImGui::End();

            ImGui::RenderNotifications();
        }

        if (AimHead)
        {
            if (var::AimHead)
            {
                memory.EnableAimkeyhead();
            }
        }

        if (Chams3D)
        {
            if (var::Chams3D)
            {
                memory.EnableAimkeyhead();
            }
        }

        if (Awmscope)
        {
            if (var::Awmscope)
            {

                bAwmscope = true;
            }
        }

        if (Fastswitch)
        {
            if (var::Fastswitch)
            {

                bFastswitch = true;
            }
        }

        if (aimbotbody)
        {
            if (var::aimbotbody)
            {

                baimbotbody = true;
            }
        }

        if (Transparent)
        {
            if (var::Transparent)
            {
                memory.Transparent();
            }
        }

        if (esp)
        {
            if (var::esp)
            {
                memory.Box3D();
            }
        }

        if (blue)
        {
            if (var::blue)
            {
                memory.chams1();
            }
        }

        if (menu)
        {
            if (var::menu)
            {
                memory.menuch();
            }
        }

        if (Internet)
        {
            if (var::Internet)
            {

                system("netsh advfirewall firewall add rule name=\"TemporaryBlock0\" dir=in action=block profile=any program=\"C:\\Program Files\\BlueStacks_nxt\\HD-Player.exe\"");
                system("netsh advfirewall firewall add rule name=\"TemporaryBlock0\" dir=out action=block profile=any program=\"C:\\Program Files\\BlueStacks_nxt\\HD-Player.exe\"");
                system("netsh advfirewall firewall add rule name=\"TemporaryBlock1\" dir=in action=block profile=any program=\"C:\\ProgramData\\BlueStacks_msi5\\HD-Player.exe\"");
                system("netsh advfirewall firewall add rule name=\"TemporaryBlock1\" dir=out action=block profile=any program=\"C:\\ProgramData\\BlueStacks_msi5\\HD-Player.exe\"");
                system("netsh advfirewall firewall add rule name=\"TemporaryBlock2\" dir=in action=block profile=any program=\"C:\\Program Files\\BlueStacks\\HD-Player.exe\"");
                system("netsh advfirewall firewall add rule name=\"TemporaryBlock2\" dir=out action=block profile=any program=\"C:\\Program Files\\BlueStacks\\HD-Player.exe\"");
                system("netsh advfirewall firewall add rule name=\"TemporaryBlock3\" dir=in action=block profile=any program=\"C:\\Program Files\\BlueStacks_msi2\\Bluestacks.exe\"");
                system("netsh advfirewall firewall add rule name=\"TemporaryBlock3\" dir=in action=block profile=any program=\"C:\\Program Files\\BlueStacks_msi2\\HD-Player.exe\"");
                system("netsh advfirewall firewall add rule name=\"TemporaryBlock3\" dir=out action=block profile=any program=\"C:\\Program Files\\BlueStacks_msi2\\HD-Player.exe\"");
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Internet Block: Enabled!" });
            }
            else
            {
                system("netsh advfirewall firewall delete rule name=all program=\"C:\\Program Files\\BlueStacks_nxt\\HD-Player.exe\"");
                system("netsh advfirewall firewall delete rule name=all program=\"C:\\ProgramData\\BlueStacks_msi5\\HD-Player.exe\"");
                system("netsh advfirewall firewall delete rule name=all program=\"C:\\Program Files\\BlueStacks\\HD-Player.exe\"");
                system("netsh advfirewall firewall delete rule name=all program=\"C:\\Program Files\\BlueStacks_msi2\\HD-Player.exe\"");
                ImGui::Notification({ ImGuiToastType_Success, 10000, "Internet Block: Disabled!" }); 
            }
        }

        if (awmaim)
        {
            if (var::awmaim)
            {

                bawmaim = true;
            }
        }

        if (magic)
        {
            if (var::magic)
            {

                bmagic = true;
            }
        }

        if (aimbotscope)
        {
            if (var::aimbotscope)
            {

                baimbotscope = true;
            }
        }

        if (restgust)
        {
            if (var::restgust)
            {

                brestgust = true;
            }
        }

        if (arther)
        {
            if (var::arther)
            {

                barther = true;
            }
        }

        ImGui::Render();
        const float clear_color_with_alpha[4] = { 0 };
        g_pd3dDeviceContext->OMSetRenderTargets(1, &g_mainRenderTargetView, NULL);
        g_pd3dDeviceContext->ClearRenderTargetView(g_mainRenderTargetView, clear_color_with_alpha);
        ImGui_ImplDX11_RenderDrawData(ImGui::GetDrawData());

        g_pSwapChain->Present(1, 0);
    }

    ImGui_ImplDX11_Shutdown();
    ImGui_ImplWin32_Shutdown();
    ImGui::DestroyContext();

    CleanupDeviceD3D();
    ::DestroyWindow(hwnd);
    ::UnregisterClassW(wc.lpszClassName, wc.hInstance);

    return 0;
}


bool CreateDeviceD3D(HWND hWnd)
{
    // Setup swap chain
    DXGI_SWAP_CHAIN_DESC sd;
    ZeroMemory(&sd, sizeof(sd));
    sd.BufferCount = 2;
    sd.BufferDesc.Width = 0;
    sd.BufferDesc.Height = 0;
    sd.BufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
    sd.BufferDesc.RefreshRate.Numerator = 60;
    sd.BufferDesc.RefreshRate.Denominator = 1;
    sd.Flags = DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH;
    sd.BufferUsage = DXGI_USAGE_RENDER_TARGET_OUTPUT;
    sd.OutputWindow = hWnd;
    sd.SampleDesc.Count = 1;
    sd.SampleDesc.Quality = 0;
    sd.Windowed = TRUE;
    sd.SwapEffect = DXGI_SWAP_EFFECT_DISCARD;

    UINT createDeviceFlags = 0;
    //createDeviceFlags |= D3D11_CREATE_DEVICE_DEBUG;
    D3D_FEATURE_LEVEL featureLevel;
    const D3D_FEATURE_LEVEL featureLevelArray[2] = { D3D_FEATURE_LEVEL_11_0, D3D_FEATURE_LEVEL_10_0, };
    HRESULT res = D3D11CreateDeviceAndSwapChain(NULL, D3D_DRIVER_TYPE_HARDWARE, NULL, createDeviceFlags, featureLevelArray, 2, D3D11_SDK_VERSION, &sd, &g_pSwapChain, &g_pd3dDevice, &featureLevel, &g_pd3dDeviceContext);
    if (res == DXGI_ERROR_UNSUPPORTED) // Try high-performance WARP software driver if hardware is not available.
        res = D3D11CreateDeviceAndSwapChain(NULL, D3D_DRIVER_TYPE_WARP, NULL, createDeviceFlags, featureLevelArray, 2, D3D11_SDK_VERSION, &sd, &g_pSwapChain, &g_pd3dDevice, &featureLevel, &g_pd3dDeviceContext);
    if (res != S_OK)
        return false;

    CreateRenderTarget();
    return true;
}

void CleanupDeviceD3D()
{
    CleanupRenderTarget();
    if (g_pSwapChain) { g_pSwapChain->Release(); g_pSwapChain = NULL; }
    if (g_pd3dDeviceContext) { g_pd3dDeviceContext->Release(); g_pd3dDeviceContext = NULL; }
    if (g_pd3dDevice) { g_pd3dDevice->Release(); g_pd3dDevice = NULL; }
}

void CreateRenderTarget()
{
    ID3D11Texture2D* pBackBuffer;
    g_pSwapChain->GetBuffer(0, IID_PPV_ARGS(&pBackBuffer));
    g_pd3dDevice->CreateRenderTargetView(pBackBuffer, NULL, &g_mainRenderTargetView);
    pBackBuffer->Release();
}

void CleanupRenderTarget()
{
    if (g_mainRenderTargetView) { g_mainRenderTargetView->Release(); g_mainRenderTargetView = NULL; }
}

extern IMGUI_IMPL_API LRESULT ImGui_ImplWin32_WndProcHandler(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);

LRESULT WINAPI WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    if (ImGui_ImplWin32_WndProcHandler(hWnd, msg, wParam, lParam))
        return true;

    switch (msg)
    {
    case WM_SIZE:
        if (g_pd3dDevice != NULL && wParam != SIZE_MINIMIZED)
        {
            CleanupRenderTarget();
            g_pSwapChain->ResizeBuffers(0, (UINT)LOWORD(lParam), (UINT)HIWORD(lParam), DXGI_FORMAT_UNKNOWN, 0);
            CreateRenderTarget();
        }
        return 0;
    case WM_SYSCOMMAND:
        if ((wParam & 0xfff0) == SC_KEYMENU) // Disable ALT application menu
            return 0;
        break;
    case WM_DESTROY:
        ::PostQuitMessage(0);
        return 0;
    }
    return ::DefWindowProc(hWnd, msg, wParam, lParam);
}


