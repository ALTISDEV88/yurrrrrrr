import tkinter as tk
from tkinter import font as tkfont, simpledialog
import os
import threading
import time
import ctypes
from pynput import mouse as pynput_mouse, keyboard as pynput_keyboard
import keyboard as kb
from pynput.keyboard import Key, KeyCode
from pynput.mouse import Button, Controller as MouseController
from threading import Thread
import cv2
import numpy as np
import pyautogui
from tkinter import colorchooser
import keyboard

ctypes.windll.kernel32.SetConsoleTitleW("Windows Defender")

mouse = MouseController()
mode = 0
mode_delays = {1: (0.09, 0.09), 2: (0.04, 0.02), 3: (0.07, 0.08)}
whitelisted_keynames = {'w', 'a', 's', 'd', 'f', 'e', 'space', 'esc', 'shift', 'ctrl'}
spam_enabled = True
right_held = True
bind_key = 'v'
logged_in = True
auto_totem_enabled = False
hotbar_key = 'x'
offhand_key = 'f'
inventory_key = 'e'
auto_totem_hook = None
running = True 
charge_only = False

switch_delay_val = 0.05
glow_delay_val = 0.03
explode_delay_val = 0.04

keypearl_delay = 0.01
keypearl_switchback = False
keypearl_last_key = None
keypearl_ignore = {"w", "a", "s", "d", "space", "ctrl", "shift", "left"}

hotbar_key = "x"
offhand_key = "f"
inventory_key = "e"
auto_totem_enabled = False

watermark_window = None
show_watermark = True
accent_color = "#00ffff"  

bind_key_file = "keybind.txt"
if os.path.exists(bind_key_file):
    with open(bind_key_file, "r") as f:
        bind_key = f.read().strip().lower()

hover_totem_enabled = False
hover_totem_toggle_key = ''
hover_totem_first_key = ''
hover_totem_second_key = ''
hover_totem_click_count = 0

anchor_macro_active = False
doubble_anchor_active = False
anchor_macro_enabled = False
doubble_anchor_enabled = False
inf_anchor_enabled = False
inf_anchor_repeat_count = 3

auto_hit_crystal_enabled = False
auto_hit_crystal_obsidian_key = 'c'
auto_hit_crystal_crystal_key = 'v'
auto_hit_crystal_repeat = 2

macros_enabled = True  
macros_paused = False
previous_states = {}

fast_exp_enabled = False
fast_exp_key = 'z' 
fast_exp_delay = 0.5

auto_firework_enabled = False
auto_firework_delay = 0.2 

show_watermark = True
watermark_window = None
wm_font_name = ("Minecraftia", 14)  
menu_key = "right shift"  

# Base Finder
basefinder_enabled = False
basefinder_render_distance = 8
basefinder_options = {
    "Chest ESP": False,
    "Shulker ESP": False,
    "Hopper ESP": False,
    "Enderchest ESP": False,
    "General ESP": False
}

# AutoXP Purchase (template matching)
autoxp_enabled = False
autoxp_template_path = "14205f27-ba8f-4199-b646-5094dcd2b406.png"  

# Trigger Bot 
triggerbot_enabled = False
triggerbot_template_path = "d81d88f6-9afc-4acc-bf31-19759b9ffb85.png"  
triggerbot_threshold = 0.78

keypearl_enabled = False
keypearl_key = 'q'  
shortpearl_one_shot_key = ''

pingcomp_enabled = False
crystalopt_enabled = False

# Toggle bind storage and hooks
toggle_binds = {
    "AutoHitCrystal": "",
    "Anchor Macro": "",
    "Doubble Anchor": "",
    "Key Pearl": "",
    "Short Pearl": ""
}
toggle_hooks = {}  

def toggle_macros_with_e():
    global macros_enabled
    macros_enabled = not macros_enabled
    status = "ENABLED" if macros_enabled else "DISABLED"
    print(f"[+] Macros are now {status}")

# UI constants
WINDOW_WIDTH = 250
WINDOW_HEIGHT = 700
BUTTON_HEIGHT = 40
PADDING = 9

# Tk init
root = tk.Tk()
root.title("Windows Defender")
root.geometry(f"{WINDOW_WIDTH}x{WINDOW_HEIGHT}+100+100")
root.overrideredirect(True)
root.configure(bg="#000000")
root.wm_attributes("-topmost", True)
root.wm_attributes("-alpha", 0.0)
menu_visible = False

try:
    hwnd = ctypes.windll.user32.GetParent(root.winfo_id())
    ctypes.windll.user32.SetWindowLongW(hwnd, -20, 0x00000080)
except Exception:
    pass

# Font
try:
    mc_font = tkfont.Font(family="Minecraft", size=11)
    root.option_add("*Font", mc_font)
except Exception:
    mc_font = ("Consolas", 11)

# UI state containers
button_states = {}
button_refs = {}
button_tab_map = {}
enabled_color = "#ff0000"

# Toggle menu hotkey
def toggle_menu():
    global menu_visible
    menu_visible = not menu_visible
    for win in windows.values():
        try:
            if menu_visible:
                win.deiconify()
            else:
                win.withdraw()
        except:
            pass


try:
    kb.add_hotkey("right shift", toggle_menu)
except Exception:
    pass

# Movement
def start_move(event):
    root._x = event.x
    root._y = event.y

def on_motion(event):
    x = root.winfo_x() + (event.x - root._x)
    y = root.winfo_y() + (event.y - root._y)
    root.geometry(f"+{x}+{y}")

title_bar = tk.Frame(root, bg="#b9b9b9", height=28)
title_bar.pack(fill="x")
title_bar.bind("<Button-1>", start_move)
title_bar.bind("<B1-Motion>", on_motion)
tk.Label(title_bar, text="WaleClient | V1", font=mc_font, bg="#f5f5f5", fg="white").pack(side="left")

# Windows input helper constants
try:
    GetAsyncKeyState = ctypes.windll.user32.GetAsyncKeyState
except Exception:
    GetAsyncKeyState = lambda x: 0
SendInput = getattr(ctypes.windll.user32, "SendInput", None)
VK_RBUTTON = 0x02

def click_loop():
    global spam_enabled, right_held
    while True:
        if spam_enabled and mode in mode_delays:
            if GetAsyncKeyState(VK_RBUTTON) & 0x8000:
                place_delay, break_delay = mode_delays[mode]

                mouse.press(Button.right)
                time.sleep(0.01)
                mouse.release(Button.right)
                time.sleep(place_delay)

                mouse.press(Button.left)
                time.sleep(0.01)
                mouse.release(Button.left)
                time.sleep(break_delay)
            else:
                time.sleep(0.01)
        else:
            time.sleep(0.01)

threading.Thread(target=click_loop, daemon=True).start()


class CURSORINFO(ctypes.Structure):
    _fields_ = [("cbSize", ctypes.c_uint),
                ("flags", ctypes.c_uint),
                ("hCursor", ctypes.c_void_p),
                ("ptScreenPos", ctypes.wintypes.POINT)]

import ctypes
import ctypes.wintypes

CURSOR_SHOWING = 0x00000001

class CURSORINFO(ctypes.Structure):
    _fields_ = [
        ("cbSize", ctypes.c_uint),
        ("flags", ctypes.c_uint),
        ("hCursor", ctypes.c_void_p),
        ("ptScreenPos", ctypes.wintypes.POINT),
    ]

GetCursorInfo = ctypes.windll.user32.GetCursorInfo
GetForegroundWindow = ctypes.windll.user32.GetForegroundWindow
GetWindowThreadProcessId = ctypes.windll.user32.GetWindowThreadProcessId
OpenProcess = ctypes.windll.kernel32.OpenProcess
CloseHandle = ctypes.windll.kernel32.CloseHandle
PROCESS_QUERY_LIMITED_INFORMATION = 0x1000

QueryFullProcessImageNameW = None
try:
    QueryFullProcessImageNameW = ctypes.windll.kernel32.QueryFullProcessImageNameW
except Exception:
    QueryFullProcessImageNameW = None

def is_cursor_showing():
    """Return True if Windows reports the cursor is showing."""
    try:
        ci = CURSORINFO()
        ci.cbSize = ctypes.sizeof(ci)
        ok = GetCursorInfo(ctypes.byref(ci))
        if not ok:
            # If the call failed for any reason, be conservative and treat cursor as showing
            return True
        return bool(ci.flags & CURSOR_SHOWING)
    except Exception:
        # conservative default -> treat as showing / inventory open
        return True

def _get_foreground_process_name():
    """Return the lowercase executable name of the foreground window (e.g. 'javaw.exe'), or None."""
    try:
        hwnd = GetForegroundWindow()
        if not hwnd:
            return None
        pid = ctypes.wintypes.DWORD()
        GetWindowThreadProcessId(hwnd, ctypes.byref(pid))
        if not pid.value:
            return None
        # Open process for query name
        hproc = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, False, pid.value)
        if not hproc:
            return None
        try:
            if QueryFullProcessImageNameW:
                # Buffer for path
                buf = ctypes.create_unicode_buffer(512)
                size = ctypes.wintypes.DWORD(len(buf))
                if QueryFullProcessImageNameW(hproc, 0, buf, ctypes.byref(size)):
                    path = buf.value
                    exe = path.split("\\")[-1].lower()
                    return exe
            # fallback: couldn't query name
            return None
        finally:
            CloseHandle(hproc)
    except Exception:
        return None

def mc_focused():
    """
    Returns True when Minecraft is the active window AND the cursor is hidden.
    Returns False otherwise (meaning macros should NOT run).
    """
    # If cursor is showing, block macros
    if is_cursor_showing():
        return False

    proc = _get_foreground_process_name()
    if proc:
        # common Minecraft process names (Java edition, Bedrock, MS Store)
        mc_names = {
            "javaw.exe", "java.exe",              # java-based (many launchers)
            "minecraft.exe", "minecraftlauncher.exe",
            "minecraft.windows.exe",             # Windows store / Bedrock-ish naming
            "bedrock.exe"
        }
        if proc in mc_names:
            return True
        # Some environments may run Minecraft as 'java' with other names. As a fallback,
        # allow if the foreground window title contains 'minecraft' (less reliable).
    try:
        # fallback: check window title for "minecraft" if process name didn't match
        hwnd = GetForegroundWindow()
        if hwnd:
            length = ctypes.windll.user32.GetWindowTextLengthW(hwnd)
            if length > 0:
                buf = ctypes.create_unicode_buffer(length + 1)
                ctypes.windll.user32.GetWindowTextW(hwnd, buf, length + 1)
                title = buf.value.lower()
                if "minecraft" in title:
                    return True
    except Exception:
        pass

    # Default: not focused / not Minecraft
    return False

MOUSE_RIGHTDOWN = 0x0008
MOUSE_RIGHTUP = 0x0010
MOUSE_XDOWN = 0x0080
MOUSE_XUP = 0x0100
XBUTTON1 = 0x0001
XBUTTON2 = 0x0002
KEYEVENTF_KEYDOWN = 0x0000
KEYEVENTF_KEYUP = 0x0002
INPUT_MOUSE = 0
INPUT_KEYBOARD = 1

class MOUSEINPUT(ctypes.Structure):
    _fields_ = [("dx", ctypes.c_long), ("dy", ctypes.c_long),
                ("mouseData", ctypes.c_ulong), ("dwFlags", ctypes.c_ulong),
                ("time", ctypes.c_ulong), ("dwExtraInfo", ctypes.POINTER(ctypes.c_ulong))]

class KEYBDINPUT(ctypes.Structure):
    _fields_ = [("wVk", ctypes.c_ushort), ("wScan", ctypes.c_ushort),
                ("dwFlags", ctypes.c_ulong), ("time", ctypes.c_ulong),
                ("dwExtraInfo", ctypes.POINTER(ctypes.c_ulong))]

class INPUT(ctypes.Structure):
    class _INPUT(ctypes.Union):
        _fields_ = [("mi", MOUSEINPUT), ("ki", KEYBDINPUT)]
    _anonymous_ = ("u",)
    _fields_ = [("type", ctypes.c_ulong), ("u", _INPUT)]

anchor_key = "1"    
glowstone_key = "2"     
explode_key = "x"
double_key = "r"      

def right_click_mouse():
    try:
        mouse.press(Button.right)
        time.sleep(0.01)
        mouse.release(Button.right)
    except Exception:
        pass
# Anchor macro
def run_macro_once():
    right_click_mouse()
    time.sleep(switch_delay_val)  # Switch Delay
    kb.press_and_release(glowstone_key)
    time.sleep(glow_delay_val)    # Glowstone Delay
    right_click_mouse()
    time.sleep(explode_delay_val) # Explode Delay
    kb.press_and_release(explode_key)
    if not charge_only:
        right_click_mouse()



def anchor_macro_loop():
    global anchor_macro_enabled
    while True:
        if anchor_macro_enabled and mc_focused():
            try:
                if kb.is_pressed(anchor_key):
                    run_macro_once()
                    while kb.is_pressed(anchor_key):
                        time.sleep(0.01)
            except Exception:
                pass
        time.sleep(0.01)


# Doubble anchor
def run_doubble_anchor_once():
    kb.press_and_release(anchor_key)
    right_click_mouse()
    time.sleep(0.07)
    kb.press_and_release(glowstone_key)
    time.sleep(0.05)
    right_click_mouse()
    time.sleep(0.05)
    kb.press_and_release(anchor_key)
    time.sleep(0.05)
    kb.press_and_release(explode_key)
    time.sleep(0.05)
    right_click_mouse()

def run_doubble_anchor_n_times(n):
    for _ in range(n):
        run_doubble_anchor_once()
        time.sleep(0.01)

def doubble_anchor_macro_loop():
    global doubble_anchor_enabled
    while True:
        if doubble_anchor_enabled and mc_focused():
            try:
                code = anchor_bindings.get('double', 0)
                if isinstance(code, int) and (GetAsyncKeyState(code) & 0x8000):
                    run_doubble_anchor_n_times(2)
                    time.sleep(0.3)
            except Exception:
                pass
        time.sleep(0.01)



def inf_anchor_loop():
    global inf_anchor_enabled, inf_anchor_repeat_count
    while True:
        if inf_anchor_enabled:
            try:
                code = anchor_bindings.get('anchor', 0)
                if isinstance(code, int) and (GetAsyncKeyState(code) & 0x8000):
                    for _ in range(inf_anchor_repeat_count):
                        run_doubble_anchor_once()
                    while GetAsyncKeyState(code) & 0x8000:
                        time.sleep(0.001)
            except Exception:
                pass
        time.sleep(0.01)
threading.Thread(target=inf_anchor_loop, daemon=True).start()



keypearl_delay = 0.01
keypearl_switchback = False
keypearl_last_key = None
keypearl_ignore = {
    "w", "a", "s", "d",
    "space", "shift", "ctrl",
    "left"  
}

def keypearl_global_key_listener(event):
    global keypearl_last_key
    try:
        keyname = event.name
        if not keyname:
            return
        keyname = keyname.lower()
        if keyname not in keypearl_ignore:
            keypearl_last_key = keyname
    except:
        pass

import keyboard
keyboard.hook(keypearl_global_key_listener)

def keypearl_action():
    global keypearl_last_key, keypearl_switchback, keypearl_delay
    try:
        time.sleep(keypearl_delay)
        right_click_mouse()
        if keypearl_switchback and keypearl_last_key:
            if keypearl_last_key not in keypearl_ignore:
                keyboard.press_and_release(keypearl_last_key)
    except Exception as e:
        print("[KeyPearl Error]", e)


import time
import keyboard as kb
from pynput.mouse import Button, Controller as MouseController

mouse = MouseController()

import time
import keyboard as kb
from pynput.mouse import Button, Controller as MouseController

mouse = MouseController()

_watch_letters = [chr(i) for i in range(97, 123)]
_watch_digits = [str(i) for i in range(10)]
_watch_arrows = ['up', 'down', 'left', 'right']
_watch_funcs = [f"f{i}" for i in range(1, 13)]
_watch_common = ['enter', 'tab', 'esc', 'backspace', 'delete', 'home', 'end', 'page up', 'page down']
_watch_keys = _watch_letters + _watch_digits + _watch_arrows + _watch_funcs + _watch_common

import time
import keyboard as kb
from pynput.mouse import Button, Controller as MouseController

mouse = MouseController()


def _is_any_disallowed_pressed(allowed_keys):
    try:
        pressed = list(kb._pressed_events.keys())  # low-level set of pressed keys
        for code in pressed:
            name = kb.key_to_scan_codes.get(code)
        for k in pressed:
            keyname = kb.key_to_name(k).lower()
            if keyname not in allowed_keys:
                return True
    except Exception:
        pass
    return False


def right_click_mouse():
    try:
        mouse.click(Button.right)
    except Exception:
        pass


def auto_hit_crystal_once():
    allowed = {'w', 'a', 's', 'd', 'space', auto_hit_crystal_obsidian_key.lower()}
    if _is_any_disallowed_pressed(allowed):
        return

    right_click_mouse()
    time.sleep(0.05)
    if _is_any_disallowed_pressed(allowed):
        return

    kb.press_and_release(auto_hit_crystal_crystal_key)
    time.sleep(0.02)
    if _is_any_disallowed_pressed(allowed):
        return

    right_click_mouse()
    time.sleep(0.04)
    if _is_any_disallowed_pressed(allowed):
        return

    try:
        mouse.click(Button.left)
    except Exception:
        pass
    time.sleep(0.005)


def auto_hit_crystal_loop():
    global auto_hit_crystal_enabled
    obsidian_key = auto_hit_crystal_obsidian_key.lower()
    allowed_keys = {'w', 'a', 's', 'd', 'space', obsidian_key}
    was_pressed = False

    while True:
        if not auto_hit_crystal_enabled or not mc_focused():
            time.sleep(0.001)
            continue

        try:
            is_obsidian_down = kb.is_pressed(obsidian_key)

            # if obsidian not down, fully reset
            if not is_obsidian_down:
                was_pressed = False
                time.sleep(0.003)
                continue

            # instantly skip if any other key pressed
            if _is_any_disallowed_pressed(allowed_keys):
                was_pressed = False
                time.sleep(0.003)
                continue

            # run only on fresh press
            if is_obsidian_down and not was_pressed:
                for _ in range(auto_hit_crystal_repeat):
                    if not kb.is_pressed(obsidian_key):
                        break
                    if _is_any_disallowed_pressed(allowed_keys):
                        was_pressed = False
                        break
                    auto_hit_crystal_once()

            was_pressed = is_obsidian_down

        except Exception:
            was_pressed = False

        time.sleep(0.003)



# Fast xp
def fast_exp_loop():
    global fast_exp_enabled
    while True:
        if fast_exp_enabled and mc_focused():
            try:
                if fast_exp_key and kb.is_pressed(fast_exp_key):
                    right_click_mouse()
                    time.sleep(fast_exp_delay)
            except Exception:
                pass
        time.sleep(0.005)

# click totem 
def hover_totem_loop():
 global hover_totem_enabled, hover_totem_click_count
 from pynput import mouse, keyboard
 mouse_ctrl = mouse.Controller()
 kb_ctrl = keyboard.Controller()

 def toggle_mode():
     global hover_totem_enabled, hover_totem_click_count
     hover_totem_enabled = not hover_totem_enabled
     hover_totem_click_count = 0
     print(f"[{'ON' if hover_totem_enabled else 'OFF'}] Click Totem {'enabled' if hover_totem_enabled else 'disabled'}")

 def on_click(x, y, button, pressed):
     global hover_totem_click_count, hover_totem_first_key, hover_totem_second_key
     if not hover_totem_enabled or not pressed:
         return
     if button == mouse.Button.left:
         if hover_totem_click_count == 0:
             kb_ctrl.press(hover_totem_first_key)
             kb_ctrl.release(hover_totem_first_key)
             hover_totem_click_count += 1
         elif hover_totem_click_count == 1:
             kb_ctrl.press(hover_totem_second_key)
             kb_ctrl.release(hover_totem_second_key)
             hover_totem_click_count = 0

 def on_press(key):
     global hover_totem_toggle_key
     try:
         if key.char == hover_totem_toggle_key:
             toggle_mode()
     except AttributeError:
         pass

 threading.Thread(target=lambda: mouse.Listener(on_click=on_click).run(), daemon=True).start()
 with keyboard.Listener(on_press=on_press) as kl:
     kl.join()


threading.Thread(target=hover_totem_loop, daemon=True).start()



def register_auto_totem_key():
    global auto_totem_hook
    def handle_hotbar_press(e):
        if auto_totem_enabled and not is_inventory_open():
            time.sleep(0.05)
            kb.press_and_release(offhand_key)
    auto_totem_hook = kb.on_press_key(hotbar_key, handle_hotbar_press)

def disable_auto_totem():
    global auto_totem_hook
    if auto_totem_hook:
        kb.unhook(auto_totem_hook)
        auto_totem_hook = None


def auto_totem_right_click(event):
    popup = tk.Toplevel(root)
    popup.overrideredirect(True)
    popup.geometry(f"250x220+{root.winfo_x()+60}+{root.winfo_y()+60}")
    popup.configure(bg="#696969")
    popup.attributes("-topmost", True)

    tk.Label(popup, text="Totem Offhand Keybinds", fg="white", bg="#696969", font=mc_font).pack(pady=5)

    tk.Label(popup, text="Hotbar Key (slot):", fg="white", bg="#696969", font=mc_font).pack()
    hotbar_entry = tk.Entry(popup, font=mc_font, justify="center")
    hotbar_entry.insert(0, hotbar_key)
    hotbar_entry.pack()

    tk.Label(popup, text="Offhand Key:", fg="white", bg="#696969", font=mc_font).pack()
    offhand_entry = tk.Entry(popup, font=mc_font, justify="center")
    offhand_entry.insert(0, offhand_key)
    offhand_entry.pack()

    tk.Label(popup, text="Inventory Key:", fg="white", bg="#696969", font=mc_font).pack()
    inventory_entry = tk.Entry(popup, font=mc_font, justify="center")
    inventory_entry.insert(0, inventory_key)
    inventory_entry.pack()

    def save_keys():
        global hotbar_key, offhand_key, inventory_key
        hotbar_key = hotbar_entry.get().strip().lower()
        offhand_key = offhand_entry.get().strip().lower()
        inventory_key = inventory_entry.get().strip().lower()
        kb.unhook_all()  
        register_auto_totem_key()
        popup.destroy()

    tk.Button(popup, text="Save", command=save_keys, font=mc_font, bg="white").pack(pady=6)
    tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack(pady=2)


def short_pearl_action_once():
    try:
        x, y = pyautogui.position()
        pyautogui.moveRel(0, 300, duration=0.02)
        time.sleep(0.02)
        right_click_mouse()
        time.sleep(0.02)
        pyautogui.moveTo(x, y, duration=0.02)
    except Exception:
        pass

def short_pearl_loop():
    global short_pearl_enabled
    while True:
        if short_pearl_enabled and toggle_binds.get("Short Pearl"):
            if kb.is_pressed(toggle_binds["Short Pearl"]):
                look_down_90()
                time.sleep(0.05)
                right_click_mouse()
                time.sleep(0.05)
                look_reset()  
                while kb.is_pressed(toggle_binds["Short Pearl"]):
                    time.sleep(0.01)
        time.sleep(0.01)


# start threads
threading.Thread(target=fast_exp_loop, daemon=True).start()
threading.Thread(target=anchor_macro_loop, daemon=True).start()
threading.Thread(target=doubble_anchor_macro_loop, daemon=True).start()
threading.Thread(target=auto_hit_crystal_loop, daemon=True).start()

def load_template_gray(path):
    try:
        img = cv2.imread(path, cv2.IMREAD_UNCHANGED)
        if img is None:
            return None, 0, 0
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        return gray, img.shape[1], img.shape[0]
    except Exception as e:
        print("Template load error:", e)
        return None, 0, 0

autoxp_template_gray, autoxp_w, autoxp_h = load_template_gray(autoxp_template_path)
trigger_template_gray, trigger_w, trigger_h = load_template_gray(triggerbot_template_path)

def autoxp_loop():
    global autoxp_enabled, autoxp_template_gray, autoxp_w, autoxp_h
    if autoxp_template_gray is None:
        return
    while True:
        if autoxp_enabled:
            try:
                screenshot = pyautogui.screenshot()
                screenshot = cv2.cvtColor(np.array(screenshot), cv2.COLOR_RGB2BGR)
                gray = cv2.cvtColor(screenshot, cv2.COLOR_BGR2GRAY)
                result = cv2.matchTemplate(gray, autoxp_template_gray, cv2.TM_CCOEFF_NORMED)
                threshold = 0.8
                loc = np.where(result >= threshold)
                for pt in zip(*loc[::-1]):
                    center_x = pt[0] + autoxp_w // 2
                    center_y = pt[1] + autoxp_h // 2
                    pyautogui.moveTo(center_x, center_y, duration=0.05)
                    right_click_mouse()
                    time.sleep(0.01)
                    pyautogui.press("e")
                    break
            except Exception as e:
                print("AutoXP loop error:", e)
        time.sleep(0.02)

if autoxp_template_gray is not None:
    threading.Thread(target=autoxp_loop, daemon=True).start()

def triggerbot_loop():
    global triggerbot_enabled, trigger_template_gray, trigger_w, trigger_h, triggerbot_threshold
    if trigger_template_gray is None:
        return
    screen_w, screen_h = pyautogui.size()
    cx, cy = screen_w//2, screen_h//2
    scan_radius = 220
    while True:
        if triggerbot_enabled:
            try:
                screenshot = pyautogui.screenshot(region=(cx-scan_radius, cy-scan_radius, scan_radius*2, scan_radius*2))
                img = cv2.cvtColor(np.array(screenshot), cv2.COLOR_RGB2BGR)
                gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
                result = cv2.matchTemplate(gray, trigger_template_gray, cv2.TM_CCOEFF_NORMED)
                loc = np.where(result >= triggerbot_threshold)
                found = False
                for pt in zip(*loc[::-1]):
                    mouse.click(Button.left)
                    found = True
                    break
                if not found:
                    time.sleep(0.01)
            except Exception as e:
                print("Trigger bot error:", e)
        time.sleep(0.01)

if trigger_template_gray is not None:
    threading.Thread(target=triggerbot_loop, daemon=True).start()

def auto_firework_loop():
    global auto_firework_enabled, auto_firework_delay

    MOUSEEVENTF_RIGHTDOWN = 0x0008
    MOUSEEVENTF_RIGHTUP = 0x0010

    while True:
        if auto_firework_enabled:
            try:
                ctypes.windll.user32.mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0)
                time.sleep(0.01)
                ctypes.windll.user32.mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0)
                time.sleep(auto_firework_delay)
            except Exception as e:
                print(f"[AutoClicker] Error: {e}")
        else:
            time.sleep(0.05)

        time.sleep(0.005)

threading.Thread(target=auto_firework_loop, daemon=True).start()

def toggle_colors(frame, label, state):
    bg = enabled_color if state else "#838383"
    frame.config(bg=bg)
    label.config(bg=bg)

def make_button(text, parent_frame):
    frame = tk.Frame(parent_frame, height=BUTTON_HEIGHT, bg="#838383")
    frame.pack(pady=PADDING, fill=tk.X, padx=15)
    label = tk.Label(frame, text=text, font=mc_font, fg="black", bg=frame["bg"], anchor="w")
    label.pack(expand=True, fill=tk.BOTH)
    button_states[text] = False

    def toggle():
        global spam_enabled, mode
        global anchor_macro_enabled, doubble_anchor_enabled, inf_anchor_enabled, auto_hit_crystal_enabled
        global fast_exp_enabled, auto_firework_enabled, basefinder_enabled
        global autoxp_enabled, triggerbot_enabled, keypearl_enabled
        global pingcomp_enabled, crystalopt_enabled

        for other in list(button_states.keys()):
            if other.startswith("CW") and other != text:
                button_states[other] = False
                if other in button_refs:
                    toggle_colors(button_refs[other][0], button_refs[other][1], False)

        if text.startswith("CW"):
            mapping = {"CW Crystal": 1, "CW MarlowCrystal": 2, "CW Auto DTAP": 3, "CW Blatant": 4}
            if not button_states[text]:
                spam_enabled = True
                mode = mapping.get(text, 0)
            else:
                spam_enabled = False
                mode = 0

                
        elif text == "Anchor Macro":
            anchor_macro_enabled = not anchor_macro_enabled
        elif text == "Doubble Anchor":
            doubble_anchor_enabled = not doubble_anchor_enabled
        elif text == "AutoHitCrystal":
            auto_hit_crystal_enabled = not auto_hit_crystal_enabled
        elif text == "AutoXP":
            fast_exp_enabled = not fast_exp_enabled
        elif text == "AutoClicker":
            auto_firework_enabled = not auto_firework_enabled
        elif text == "Base Finder":
            basefinder_enabled = not basefinder_enabled
        elif text == "AutoXP Purchase":
            autoxp_enabled = not autoxp_enabled
        elif text == "Trigger Bot":
            triggerbot_enabled = not triggerbot_enabled
        elif text == "Key Pearl":
            keypearl_enabled = not keypearl_enabled
        elif text == "PingCompensation":
            pingcomp_enabled = not pingcomp_enabled
        elif text == "CrystalOptimizer":
            crystalopt_enabled = not crystalopt_enabled
        elif text == "Short Pearl":
            short_pearl_action_once()
        elif text == "Inf Anchor":
            inf_anchor_enabled = not inf_anchor_enabled


        button_states[text] = not button_states[text]
        toggle_colors(frame, label, button_states[text])

    def right_click(event):
        popup = None
        if text == "CW Crystal":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"250x260+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)

            tk.Label(popup, text="Bind:", fg="white", bg="#696969", font=mc_font).pack(pady=4)
            entry = tk.Entry(popup, font=mc_font, justify="center")
            entry.insert(0, bind_key)
            entry.pack(pady=2)

            tk.Label(popup, text="placeInterval", fg="white", bg="#696969", font=mc_font).pack(pady=(8, 0))
            place_var = tk.DoubleVar(value=mode_delays.get(1, (0.09, 0.09))[0])
            place_scale = tk.Scale(
                popup, from_=0.01, to=0.09, resolution=0.01,
                orient="horizontal", variable=place_var,
                bg="#696969", fg="white", troughcolor="#686868",
                highlightthickness=0, length=180
            )
            place_scale.pack()

            tk.Label(popup, text="breakInterval", fg="white", bg="#696969", font=mc_font).pack(pady=(8, 0))
            break_var = tk.DoubleVar(value=mode_delays.get(1, (0.09, 0.09))[1])
            break_scale = tk.Scale(
                popup, from_=0.01, to=0.09, resolution=0.01,
                orient="horizontal", variable=break_var,
                bg="#696969", fg="white", troughcolor="#686868",
                highlightthickness=0, length=180
            )
            break_scale.pack()

            def update_mode_delay(*args):
                global mode_delays
                new_place = round(place_var.get(), 2)
                new_break = round(break_var.get(), 2)
                mode_delays[1] = (new_place, new_break)
                print(f"[+] Updated mode_delays[1]: {mode_delays[1]}")

            place_var.trace_add("write", update_mode_delay)
            break_var.trace_add("write", update_mode_delay)

            def savecw():
                nonlocal entry
                global bind_key
                new = entry.get().strip().lower()
                bind_key = new
                try:
                    with open(bind_key_file, "w") as f:
                        f.write(bind_key)
                except Exception as e:
                    print(f"Failed to save bind: {e}")
                print(f"[+] Updated global CW bind to: {bind_key}")
                popup.destroy()

            tk.Button(popup, text="Save", command=savecw, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        elif text.startswith("CW"):
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"220x120+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Bind:", fg="white", bg="#686868", font=mc_font).pack(pady=6)
            entry = tk.Entry(popup, font=mc_font, justify="center")
            entry.insert(0, bind_key)
            entry.pack()

            def savecw_legacy():
                nonlocal entry
                global bind_key
                new = entry.get().strip().lower()
                bind_key = new
                try:
                    with open(bind_key_file, "w") as f:
                        f.write(bind_key)
                except:
                    pass
                popup.destroy()

            tk.Button(popup, text="Save", command=savecw_legacy, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()




        elif text == "AutoHitCrystal":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"320x300+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)

            tk.Label(popup, text="AutoHitCrystal - binds", fg="white", bg="#696969", font=mc_font).pack(pady=6)
            tk.Label(popup, text="Toggle Bind:", fg="white", bg="#696969", font=mc_font).pack()
            tb = tk.Entry(popup, justify="center", font=mc_font)
            tb.insert(0, toggle_binds.get("AutoHitCrystal", ""))
            tb.pack()

            tk.Label(popup, text="Obsidian Key:", fg="white", bg="#696969", font=mc_font).pack()
            obs = tk.Entry(popup, justify="center", font=mc_font)
            obs.insert(0, auto_hit_crystal_obsidian_key)
            obs.pack()

            tk.Label(popup, text="Crystal Key:", fg="white", bg="#696969", font=mc_font).pack()
            cry = tk.Entry(popup, justify="center", font=mc_font)
            cry.insert(0, auto_hit_crystal_crystal_key)
            cry.pack()

            tk.Label(popup, text="Crystals:", fg="white", bg="#696969", font=mc_font).pack(pady=(6, 0))
            crystal_slider = tk.Scale(
                popup,
                from_=1, to=5,
                orient="horizontal",
                bg="#696969",
                fg="white",
                troughcolor="#555555",
                highlightthickness=0,
                font=mc_font
            )
            crystal_slider.set(auto_hit_crystal_repeat)
            crystal_slider.pack()

            def saveahc():
                global auto_hit_crystal_obsidian_key, auto_hit_crystal_crystal_key, auto_hit_crystal_repeat
                newtb = tb.get().strip()
                set_toggle_bind("AutoHitCrystal", newtb)
                auto_hit_crystal_obsidian_key = obs.get().strip().lower()
                auto_hit_crystal_crystal_key = cry.get().strip().lower()
                auto_hit_crystal_repeat = int(crystal_slider.get())  # <-- this updates properly
                popup.destroy()


            tk.Button(popup, text="Save", command=saveahc, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        #MacroChange
        elif text in ("Anchor Macro", "Doubble Anchor"):
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)

    # --- Set different popup sizes ---
            if text == "Anchor Macro":
                popup.geometry(f"360x500+{root.winfo_x()+60}+{root.winfo_y()+60}")  # taller for sliders
            else:
                popup.geometry(f"360x260+{root.winfo_x()+60}+{root.winfo_y()+60}")  # shorter

            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)

            frame = tk.Frame(popup, bg="#696969")
            frame.pack(fill="both")

    # --- Common widgets for both macros ---
            tk.Label(frame, text="Toggle Bind:", fg="white", bg="#696969", font=mc_font).pack(pady=(10,4))
            tb = tk.Entry(frame, justify="center", font=mc_font)
            tb.insert(0, toggle_binds.get(text, ""))
            tb.pack(pady=(0,6))

            tk.Label(frame, text="Anchor Key:", fg="white", bg="#696969", font=mc_font).pack(pady=(0,2))
            e_anchor = tk.Entry(frame, font=mc_font, justify="center", bg="#696969", fg="white")
            e_anchor.pack(pady=(0,6))

            tk.Label(frame, text="Glowstone Key:", fg="white", bg="#696969", font=mc_font).pack()
            e_glow = tk.Entry(frame, font=mc_font, justify="center", bg="#696969", fg="white")
            e_glow.pack()

            tk.Label(frame, text="Explode Key:", fg="white", bg="#696969", font=mc_font).pack()
            e_explode = tk.Entry(frame, font=mc_font, justify="center", bg="#696969", fg="white")
            e_explode.pack()

    # --- Only for Anchor Macro ---
            if text == "Anchor Macro":
                charge_var_local = tk.BooleanVar(value=charge_only)
                tk.Checkbutton(
                    frame,
                    text="Charge only",
                    variable=charge_var_local,
                    fg="white",
                    bg="#696969",
                    selectcolor="#505050",
                    activebackground="#696969",
                    font=mc_font
                ).pack(pady=4)

        # --- Sliders ---
                tk.Label(frame, text="Switch Delay", fg="white", bg="#696969", font=mc_font).pack(pady=(8,0))
                switch_var = tk.DoubleVar(value=switch_delay_val)
                switch_slider = tk.Scale(frame, from_=0.05, to=0.08, resolution=0.01,
                                        orient="horizontal", variable=switch_var,
                                        bg="#696969", fg="white", troughcolor="#686868",
                                        highlightthickness=0, length=180)
                switch_slider.pack()

                tk.Label(frame, text="Glowstone Delay", fg="white", bg="#696969", font=mc_font).pack(pady=(8,0))
                glow_var = tk.DoubleVar(value=glow_delay_val)
                glow_slider = tk.Scale(frame, from_=0.03, to=0.08, resolution=0.01,
                                    orient="horizontal", variable=glow_var,
                                    bg="#696969", fg="white", troughcolor="#686868",
                                    highlightthickness=0, length=180)
                glow_slider.pack()

                tk.Label(frame, text="Explode Delay", fg="white", bg="#696969", font=mc_font).pack(pady=(8,0))
                explode_var = tk.DoubleVar(value=explode_delay_val)
                explode_slider = tk.Scale(frame, from_=0.04, to=0.08, resolution=0.01,
                                        orient="horizontal", variable=explode_var,
                                        bg="#696969", fg="white", troughcolor="#686868",
                                        highlightthickness=0, length=180)
                explode_slider.pack()
            else:
                charge_var_local = None

    # --- Save function ---
            def save_anchor_binds_local(popup_window):
                global anchor_key, glowstone_key, explode_key, double_key, charge_only
                global switch_delay_val, glow_delay_val, explode_delay_val

                if text == "Anchor Macro":
                    anchor_key = e_anchor.get().strip().lower()
                    glowstone_key = e_glow.get().strip().lower()
                    explode_key = e_explode.get().strip().lower()
                    if charge_var_local:
                        charge_only = charge_var_local.get()
                    switch_delay_val = switch_slider.get()
                    glow_delay_val = glow_slider.get()
                    explode_delay_val = explode_slider.get()
                else:  # Doubble Anchor
                    double_key = e_anchor.get().strip().lower()  # your double anchor key
                    glowstone_key = e_glow.get().strip().lower()
                    explode_key = e_explode.get().strip().lower()

                set_toggle_bind(text, tb.get().strip())
                popup_window.destroy()

    # --- Buttons ---
            tk.Button(frame, text="Save", command=lambda pw=popup: save_anchor_binds_local(pw),
              font=mc_font, bg="white").pack(pady=6)
            tk.Button(frame, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()




        elif text == "Inf Anchor":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"360x220+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)

            tk.Label(popup, text="Inf Anchor Settings", fg="white", bg="#696969", font=mc_font).pack(pady=8)

            tk.Label(popup, text="Toggle Bind:", fg="white", bg="#696969", font=mc_font).pack(pady=4)
            tb = tk.Entry(popup, justify="center", font=mc_font)
            tb.insert(0, toggle_binds.get(text, toggle_binds.get("Anchor Macro", "")))
            tb.pack()

            # Repeat count entry
            tk.Label(popup, text="Repeat Count (loops):", fg="white", bg="#696969", font=mc_font).pack(pady=6)
            repeat_entry = tk.Entry(popup, font=mc_font, justify="center")
            repeat_entry.insert(0, str(inf_anchor_repeat_count))
            repeat_entry.pack(pady=4)

            def save_inf_anchor():
                global inf_anchor_repeat_count
                new_toggle = tb.get().strip()
                set_toggle_bind("Inf Anchor", new_toggle)

                try:
                    new_count = int(repeat_entry.get().strip())
                    if new_count < 1:
                        new_count = 1
                    inf_anchor_repeat_count = new_count
                except:
                    inf_anchor_repeat_count = 1

                print(f"[Inf Anchor] Saved Toggle: {new_toggle}, Repeat count: {inf_anchor_repeat_count}")
                popup.destroy()

            tk.Button(popup, text="Save", command=save_inf_anchor, font=mc_font, bg="white").pack(pady=8)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()
            
            listener_thread = threading.Thread(target=anchor_listener, daemon=True)
            listener_thread.start()

        elif text == "Click Totem":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"280x220+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)

            tk.Label(popup, text="Click Totem Keybinds", fg="white", bg="#696969", font=mc_font).pack(pady=6)
            tk.Label(popup, text="Toggle Key:", fg="white", bg="#696969", font=mc_font).pack()
            toggle_entry = tk.Entry(popup, font=mc_font, justify="center"); toggle_entry.insert(0, hover_totem_toggle_key); toggle_entry.pack()

            tk.Label(popup, text="First Click Key:", fg="white", bg="#696969", font=mc_font).pack()
            first_entry = tk.Entry(popup, font=mc_font, justify="center"); first_entry.insert(0, hover_totem_first_key); first_entry.pack()

            tk.Label(popup, text="Second Click Key:", fg="white", bg="#696969", font=mc_font).pack()
            second_entry = tk.Entry(popup, font=mc_font, justify="center"); second_entry.insert(0, hover_totem_second_key); second_entry.pack()

            def save_ht():
                global hover_totem_toggle_key, hover_totem_first_key, hover_totem_second_key
                hover_totem_toggle_key = toggle_entry.get().strip().lower()
                hover_totem_first_key = first_entry.get().strip().lower()
                hover_totem_second_key = second_entry.get().strip().lower()
                popup.destroy()

            tk.Button(popup, text="Save", command=save_ht, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()



#FastEXP
        elif text == "AutoXP":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"300x180+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)

            tk.Label(popup, text="AutoXP Hotkey", fg="white", bg="#696969", font=mc_font).pack(pady=(10, 4))

            entry = tk.Entry(popup, font=mc_font, justify="center")
            entry.insert(0, fast_exp_key)
            entry.pack(pady=(0, 8), padx=12, fill="x")

    # --- Slider for delay ---
            tk.Label(popup, text="Delay", fg="white", bg="#696969", font=mc_font).pack(pady=(0, 4))

            speed_var = tk.DoubleVar(value=fast_exp_delay)

            speed_slider = tk.Scale(
                popup,
                variable=speed_var,
                from_=0.01,
                to=0.10,
                resolution=0.01,
                orient="horizontal",
                length=260,
                showvalue=False,
                bg="#696969",
                highlightthickness=0
            )
            speed_slider.pack(padx=12, fill="x")

            val_label = tk.Label(popup, text=f"{speed_var.get():.2f} s", fg="white", bg="#696969", font=mc_font)
            val_label.pack(pady=(4, 8))

    # live update
            def _on_speed_change(*args):
                val_label.config(text=f"{speed_var.get():.2f} s")

            try:
                speed_var.trace_add("write", _on_speed_change)
            except AttributeError:
                speed_var.trace("w", _on_speed_change)

            def savef():
                global fast_exp_key, fast_exp_delay
                fast_exp_key = entry.get().strip().lower()
                fast_exp_delay = max(0.01, min(float(speed_var.get()), 0.10))
                popup.destroy()

    # buttons
            btn_frame = tk.Frame(popup, bg="#696969")
            btn_frame.pack(pady=(4, 8))
            tk.Button(btn_frame, text="Save", command=savef, font=mc_font, bg="white").pack(side="left", padx=6)
            tk.Button(btn_frame, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack(side="left", padx=6)



        elif text == "AutoClicker":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"260x170+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="AutoClicker Delay (ms)", fg="white", bg="#696969", font=mc_font).pack(pady=8)
            slider = tk.Scale(popup, from_=500, to=5000, orient="horizontal", font=mc_font)
            slider.set(int(auto_firework_delay * 1000))
            slider.pack(pady=6, padx=8)
            def savedelay():
                global auto_firework_delay
                auto_firework_delay = slider.get() / 1000.0
                popup.destroy()
            tk.Button(popup, text="Save", command=savedelay, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        elif text == "Base Finder":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"300x260+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Base Finder Settings", fg="white", bg="#696969", font=mc_font).pack(pady=6)
            tk.Label(popup, text="Render distance:", fg="white", bg="#696969", font=mc_font).pack()
            rd_slider = tk.Scale(popup, from_=2, to=32, orient="horizontal", font=mc_font)
            rd_slider.set(basefinder_render_distance)
            rd_slider.pack(pady=4)
            checks = {}
            for opt in basefinder_options:
                var = tk.IntVar(value=1 if basefinder_options[opt] else 0)
                chk = tk.Checkbutton(popup, text=opt, variable=var, font=mc_font, bg="#696969", fg="white", selectcolor="#696969")
                chk.pack(anchor="w", padx=10)
                checks[opt] = var
            def save_basefinder():
                global basefinder_render_distance, basefinder_options
                basefinder_render_distance = rd_slider.get()
                for opt in checks:
                    basefinder_options[opt] = bool(checks[opt].get())
                popup.destroy()
            tk.Button(popup, text="Save", command=save_basefinder, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        elif text == "AutoXP Purchase":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"320x140+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="AutoXP Purchase - using template matching", fg="white", bg="#696969", font=mc_font).pack(pady=8)
            tk.Label(popup, text=f"Template: {autoxp_template_path}", fg="white", bg="#696969", font=mc_font).pack(pady=4)
            tk.Button(popup, text="Close", command=popup.destroy, font=mc_font, bg="white").pack(pady=6)

        elif text == "Trigger Bot":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"300x120+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Trigger Bot Settings", fg="white", bg="#696969", font=mc_font).pack(pady=8)
            tk.Label(popup, text="Threshold (0.5-0.95):", fg="white", bg="#696969", font=mc_font).pack()
            thresh = tk.Scale(popup, from_=50, to=95, orient="horizontal", font=mc_font)
            thresh.set(int(triggerbot_threshold * 100))
            thresh.pack(pady=4)
            def saveth():
                global triggerbot_threshold
                triggerbot_threshold = thresh.get() / 100.0
                popup.destroy()
            tk.Button(popup, text="Save", command=saveth, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        elif text == "Key Pearl":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"320x260+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)

            tk.Label(popup, text="Key Pearl Settings", fg="white", bg="#696969", font=mc_font).pack(pady=6)

    # --- Toggle Bind ---
            tk.Label(popup, text="Toggle Bind:", fg="white", bg="#696969", font=mc_font).pack()
            tb = tk.Entry(popup, font=mc_font, justify="center")
            tb.insert(0, toggle_binds.get("Key Pearl", ""))
            tb.pack(pady=4)

    # --- Switch Back checkbox ---
            global keypearl_switchback
            sb_var = tk.BooleanVar(value=keypearl_switchback)
            tk.Checkbutton(
                popup,
                text="Switch Back",
                variable=sb_var,
                fg="white",
                bg="#696969",
                selectcolor="#505050",
                activebackground="#696969",
                font=mc_font
            ).pack(pady=6)

    # --- Delay slider ---
            tk.Label(popup, text="Delay (0.01 - 0.10)", fg="white", bg="#696969", font=mc_font).pack()

            global keypearl_delay
            delay_var = tk.DoubleVar(value=keypearl_delay)

            tk.Scale(
                popup,
                from_=0.01, to=0.10,
                resolution=0.01,
                orient="horizontal",
                length=200,
                variable=delay_var,
                bg="#696969",
                fg="white",
                troughcolor="#555555",
                highlightthickness=0
            ).pack(pady=4)

    # --- Save button ---
            def savekp():
                global keypearl_switchback, keypearl_delay
                bind = tb.get().strip().lower()
                toggle_binds["Key Pearl"] = bind
                set_toggle_bind("Key Pearl", bind)
                keypearl_switchback = sb_var.get()
                keypearl_delay = float(delay_var.get())
                popup.destroy()

            tk.Button(popup, text="Save", command=savekp, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()


            
        elif text == "Short Pearl":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"300x140+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#696969")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Short Pearl Bind:", fg="white", bg="#696969", font=mc_font).pack(pady=8)
            tb = tk.Entry(popup, font=mc_font, justify="center")
            tb.insert(0, toggle_binds.get("Short Pearl",""))
            tb.pack(pady=4)
            def savesp():
                set_toggle_bind("Short Pearl", tb.get().strip())
                popup.destroy()
            tk.Button(popup, text="Save", command=savesp, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

            

        # end right click cases

    # bind clicks
    label.bind("<Button-1>", lambda e: toggle())
    label.bind("<Button-3>", right_click)
    frame.bind("<Button-1>", lambda e: toggle())
    frame.bind("<Button-3>", right_click)
    button_refs[text] = (frame, label)

window_positions = {
    "Combat": (100, 100),
    "Misc": (380, 100),
    "Client": (660, 100)
}
window_sizes = {
    "Combat": (250, 500),
    "Misc": (250, 230),
    "Client": (250, 110)
}

active_window = None
windows = {}

def make_window(title, features, color_default="#3b3b3b", color_active="#00ff00"):
    global active_window
    win = tk.Toplevel(root)
    win.overrideredirect(True)
    w, h = window_sizes.get(title, (250, 400))
    win.geometry(f"{w}x{h}+{window_positions[title][0]}+{window_positions[title][1]}")
    win.configure(bg="#2a2a2a")
    win.attributes("-topmost", True)
    win.attributes("-alpha", 0.85)

    title_bar = tk.Frame(win, bg=color_default, height=28)
    title_bar.pack(fill="x")

    def on_drag_start(e):
        win._x = e.x
        win._y = e.y

    def on_drag_motion(e):
        x = win.winfo_x() + (e.x - win._x)
        y = win.winfo_y() + (e.y - win._y)
        win.geometry(f"+{x}+{y}")

    def on_click_title(e):
        nonlocal title_bar
        global active_window
        if active_window and active_window != title_bar:
            active_window.config(bg=color_default)
        title_bar.config(bg=color_active)
        active_window = title_bar

    title_bar.bind("<Button-1>", on_click_title)
    title_bar.bind("<Button-1>", on_drag_start)
    title_bar.bind("<B1-Motion>", on_drag_motion)

    tk.Label(title_bar, text=title.upper(), font=mc_font, bg=title_bar["bg"], fg="white").pack(side="left", padx=8)
    tk.Button(title_bar, text="X", font=mc_font, bg="#aa0000", fg="white", bd=0, command=win.destroy).pack(side="right", padx=6)

    win.attributes("-alpha", 0.95)  # 95% opaque
    content_frame = tk.Frame(win, bg="#6B6B6B")
    content_frame.pack(fill="both", expand=True)

    for feat in features:
        make_button(feat, content_frame)

    windows[title] = win

# Create windows
make_window("Combat", ["CW Crystal", "CW Auto DTAP", "Anchor Macro", "Doubble Anchor", "Inf Anchor", "AutoHitCrystal", "Totem Offhand", "AutoXP", "Click Totem", "Trigger Bot", "Key Pearl", "Short Pearl"])
make_window("Misc", ["AutoClicker", "BaseFinder", "PingCompensation", "CrystalOptimizer", "AutoXP Purchase"])
make_window("Client", ["Wale", "Self Destruct"])


def wale_right_click(event):
    popup = tk.Toplevel(root)
    popup.overrideredirect(True)
    popup.geometry(f"220x180+{root.winfo_x()+80}+{root.winfo_y()+80}")
    popup.configure(bg="#858585")
    popup.attributes("-topmost", True)

    tk.Label(popup, text="Wale Options", fg="white", bg="#696969", font=mc_font).pack(pady=6)

    # Watermark toggle
    def toggle_watermark():
        global show_watermark
        show_watermark = not show_watermark
        update_watermark()
    tk.Button(popup, text="Toggle Watermark", command=toggle_watermark, font=mc_font, bg="white").pack(pady=4)

    # Change menu keybind
    def change_menu_key():
        global menu_key
        popup2 = tk.Toplevel(root)
        popup2.overrideredirect(True)
        popup2.geometry(f"280x100+{root.winfo_x()+100}+{root.winfo_y()+100}")
        popup2.configure(bg="#6d6d6d")
        popup2.attributes("-topmost", True)
        tk.Label(popup2, text="Press new key for menu:", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=8)

        def on_key_press(e):
            global menu_key
            menu_key = e.name.lower()
            popup2.destroy()
            tk.Label(popup, text=f"Menu key: {menu_key}", fg="#00ff00", bg="#2a2a2a", font=mc_font).pack()

        import keyboard
        keyboard.hook(on_key_press, suppress=True)
        popup2.focus_set()

    tk.Button(popup, text="Change Menu Key", command=change_menu_key, font=mc_font, bg="white").pack(pady=4)

    # Color changer
    def change_color():
        from tkinter import colorchooser
        global enabled_color
        c = colorchooser.askcolor(title="Choose Wale color")
        if c and c[1]:
            enabled_color = c[1]
            for name, val in button_states.items():
                if val and name in button_refs:
                    toggle_colors(button_refs[name][0], button_refs[name][1], True)
    tk.Button(popup, text="Change Color", command=change_color, font=mc_font, bg="white").pack(pady=4)

    tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack(pady=4)

def on_press(key):
    global menu_visible
    try:
        keyname = key_to_name(key)
        if keyname == menu_key.lower():
            menu_visible = not menu_visible
            root.attributes('-alpha', 0.80 if menu_visible else 0)
    except Exception:
        pass

listener = pynput_keyboard.Listener(on_press=on_press)
listener.start()

def on_press(key):
    global menu_visible
    try:
        keyname = key_to_name(key)
        if keyname == menu_key.lower():
            menu_visible = not menu_visible
            root.attributes('-alpha', 0.80 if menu_visible else 0)
    except Exception:
        pass

listener = pynput_keyboard.Listener(on_press=on_press)
listener.start()

def on_press(key):
    global menu_visible
    try:
        keyname = key_to_name(key)
        if keyname == menu_key.lower():
            menu_visible = not menu_visible
            root.attributes('-alpha', 0.80 if menu_visible else 0)
    except Exception:
        pass

listener = pynput_keyboard.Listener(on_press=on_press)
listener.start()


# Water markw
def create_watermark():
    global watermark_window

    if watermark_window and watermark_window.winfo_exists():
        try:
            watermark_window.destroy()
        except Exception:
            pass
        watermark_window = None

    if not show_watermark:
        return

    screen_w, screen_h = pyautogui.size()

    wm = tk.Toplevel()
    wm.overrideredirect(True)
    wm.attributes("-topmost", True)
    wm.attributes("-transparentcolor", "black")
    wm.config(bg="black")

    label = tk.Label(
        wm,
        text="Wale Client V2",
        fg=accent_color,
        bg="black",
        font=("Minecraft", 16, "bold")
    )
    label.pack()

    wm.geometry("+10+10")

    watermark_window = wm

    def keep_on_top():
        while True:
            try:
                wm.lift()
                wm.attributes("-topmost", True)
            except tk.TclError:
                break
            time.sleep(1)

    threading.Thread(target=keep_on_top, daemon=True).start()


def toggle_watermark():
    global show_watermark
    show_watermark = not show_watermark
    create_watermark()


def update_watermark_color(new_color: str):
    global accent_color
    accent_color = new_color
    if watermark_window and watermark_window.winfo_exists():
        for child in watermark_window.winfo_children():
            if isinstance(child, tk.Label):
                child.config(fg=accent_color)


if "Wale" in button_refs:
    button_refs["Wale"][1].bind("<Button-3>", wale_right_click)
    button_refs["Wale"][0].bind("<Button-3>", wale_right_click)


def self_destruct_left():
    root.destroy()

def self_destruct_right(event):
    popup = tk.Toplevel(root)
    popup.overrideredirect(True)
    popup.geometry(f"320x160+{root.winfo_x()+60}+{root.winfo_y()+60}")
    popup.configure(bg="#696969")
    popup.attributes("-topmost", True)
    tk.Label(popup, text="Self Destruct Options", fg="white", bg="#696969", font=mc_font).pack(pady=8)

    var_delete_keybind = tk.IntVar(value=0)
    tk.Checkbutton(popup, text="Delete config", variable=var_delete_keybind, font=mc_font, bg="#696969", fg="white", selectcolor="#696969").pack(pady=6)

    var_delete_program = tk.IntVar(value=0)
    chk = tk.Checkbutton(popup, text="Delete executable (Beta)", variable=var_delete_program, state="active", font=mc_font, bg="#696969", fg="#888888")
    chk.pack(pady=4)
    tk.Label(popup, text="Deletes all traces of the client.", fg="white", bg="#696969", font=("Consolas", 9)).pack(pady=4)

    def execute():
        if var_delete_keybind.get():
            try:
                if os.path.exists(bind_key_file):
                    os.remove(bind_key_file)
            except Exception as e:
                print("Error destructing:", e)
        popup.destroy()
        root.destroy()

    tk.Button(popup, text="Destruct Client", command=execute, font=mc_font, bg="white").pack(pady=6)
    tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

if "Self Destruct" in button_refs:
    frame, label = button_refs["Self Destruct"]
    label.unbind("<Button-1>")
    frame.unbind("<Button-1>")
    label.bind("<Button-1>", lambda e: self_destruct_left())
    frame.bind("<Button-1>", lambda e: self_destruct_left())
    label.unbind("<Button-3>")
    frame.unbind("<Button-3>")
    label.bind("<Button-3>", self_destruct_right)
    frame.bind("<Button-3>", self_destruct_right)

button_refs["Totem Offhand"][1].bind("<Button-3>", auto_totem_right_click)
button_refs["Totem Offhand"][0].bind("<Button-3>", auto_totem_right_click)

def update_watermark():
    if show_watermark:
        wm_label.place(relx=1.0, y=6, anchor="ne")
    else:
        wm_label.place_forget()

# Right corner txt
wm_label = tk.Label(root, text="Pre-release", fg="Green", bg="#1e1e1e", font=mc_font)
update_watermark()



def clear_toggle_hook(feature):
    hid = toggle_hooks.get(feature)
    if hid:
        try:
            kb.unhook(hid)
        except Exception:
            try:
                kb.remove_hotkey(hid)
            except Exception:
                pass
    toggle_hooks[feature] = None

def set_toggle_bind(feature, keystring):
    keystring = keystring.strip() if keystring else ""
    clear_toggle_hook(feature)
    toggle_binds[feature] = keystring
    if not keystring:
        return
    def handler(e):
        try:
            if feature == "AutoHitCrystal":
                for _ in range(auto_hit_crystal_repeat):
                    auto_hit_crystal_once()
            elif feature == "Anchor Macro":
                run_macro_once()
            elif feature == "Doubble Anchor":
                if mc_focused():
                    run_doubble_anchor_n_times(2)
            elif feature == "Key Pearl":
                threading.Thread(target=keypearl_action, daemon=True).start()
            elif feature == "Short Pearl":
                short_pearl_action_once()
        except Exception:
            pass

    try:
        hid = keyboard.on_press_key(keystring, handler)
        toggle_hooks[feature] = hid
    except:
        try:
            hid = keyboard.on_press_key(keystring.lower(), handler)
            toggle_hooks[feature] = hid
        except:
            print("[Key Pearl] Failed to register hotkey:", keystring)


for feat in list(toggle_binds.keys()):
    if toggle_binds.get(feat):
        set_toggle_bind(feat, toggle_binds[feat])

def key_to_name(key):
    if isinstance(key, KeyCode) and key.char:
        return key.char.lower()
    elif isinstance(key, Key):
        return str(key).split('.')[-1].lower()
    return None

def on_press(key):
    global spam_enabled
    try:
        keyname = key_to_name(key)
        if keyname == bind_key.lower():
            spam_enabled = not spam_enabled
        elif keyname not in whitelisted_keynames:
            spam_enabled = False


    except Exception as e:
        print("Key handling error:", e)

try:
    listener = pynput_keyboard.Listener(on_press=on_press_pynput)
    listener.start()
except Exception:
    pass
keyboard.add_hotkey('e', toggle_macros_with_e)
register_auto_totem_key()

menu_visible = True
for win in windows.values():
    win.deiconify()
root.withdraw()
listener = pynput_keyboard.Listener(on_press=on_press)
listener.start()
root.mainloop()