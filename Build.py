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
ctypes.windll.kernel32.SetConsoleTitleW("Windows Defender")

mouse = MouseController()
mode = 0
mode_delays = {1: (0.04, 0.05), 2: (0.04, 0.02), 3: (0.07, 0.08)}
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

anchor_bindings = { 
    'anchor': 0x06, 
    'glowstone': 0x58, 
    'totem': 0x05, 
    'double': 0x52
 }

hotbar_key = "x"
offhand_key = "f"
inventory_key = "e"
auto_totem_enabled = False

bind_key_file = "keybind.txt"
if os.path.exists(bind_key_file):
    with open(bind_key_file, "r") as f:
        bind_key = f.read().strip().lower()

anchor_macro_active = False
doubble_anchor_active = False
anchor_macro_enabled = False
doubble_anchor_enabled = False

auto_hit_crystal_enabled = False
auto_hit_crystal_obsidian_key = 'c'
auto_hit_crystal_crystal_key = 'v'
auto_hit_crystal_repeat = 2

fast_exp_enabled = False
fast_exp_key = 'z' 

auto_firework_enabled = False
auto_firework_delay = 0.2 

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
autoxp_template_path = "14205f27-ba8f-4199-b646-5094dcd2b406.png"  # if you have another filename, change it

# Trigger Bot 
triggerbot_enabled = False
triggerbot_template_path = "d81d88f6-9afc-4acc-bf31-19759b9ffb85.png"  # your uploaded screenshot
triggerbot_threshold = 0.78

keypearl_enabled = False
keypearl_key = ''  
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

# UI constants
WINDOW_WIDTH = 250
WINDOW_HEIGHT = 700
BUTTON_HEIGHT = 36
PADDING = 6

# Tk init
root = tk.Tk()
root.title("Wale")
root.geometry(f"{WINDOW_WIDTH}x{WINDOW_HEIGHT}+100+100")
root.overrideredirect(True)
root.configure(bg='#2a2a2a')
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
enabled_color = "#66ccff"

# Toggle menu hotkey
def toggle_menu():
    global menu_visible
    menu_visible = not menu_visible
    root.attributes('-alpha', 0.80 if menu_visible else 0.0)

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

title_bar = tk.Frame(root, bg="#1e1e1e", height=28)
title_bar.pack(fill="x")
title_bar.bind("<Button-1>", start_move)
title_bar.bind("<B1-Motion>", on_motion)
tk.Label(title_bar, text="WaleClient | V1", font=mc_font, bg="#1e1e1e", fg="white").pack(side="left")

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

def is_inventory_open():
    ci = CURSORINFO()
    ci.cbSize = ctypes.sizeof(ci)
    ctypes.windll.user32.GetCursorInfo(ctypes.byref(ci))
    return ci.flags == 1  #1 = visible cursor (inventory open)

# mouse/key sending helpers (best-effort)
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

def click_mouse_custom(button_code):
    if SendInput is None:
        return
    for action in [MOUSE_XDOWN, MOUSE_XUP]:
        inp = INPUT(type=INPUT_MOUSE)
        inp.mi = MOUSEINPUT(0, 0, button_code, action, 0, None)
        SendInput(1, ctypes.byref(inp), ctypes.sizeof(INPUT))

def right_click_mouse():
    try:
        mouse.press(Button.right)
        time.sleep(0.01)
        mouse.release(Button.right)
    except Exception:
        pass

def press_key_vk(vk_code):
    if SendInput is None:
        return
    for flag in [KEYEVENTF_KEYDOWN, KEYEVENTF_KEYUP]:
        key = INPUT(type=INPUT_KEYBOARD)
        key.ki = KEYBDINPUT(wVk=vk_code, wScan=0, dwFlags=flag, time=0, dwExtraInfo=None)
        SendInput(1, ctypes.byref(key), ctypes.sizeof(INPUT))

# Macro logic (threads)
def run_macro_once():
    right_click_mouse()
    time.sleep(0.05)
    click_mouse_custom(XBUTTON1)
    time.sleep(0.06)
    right_click_mouse()
    time.sleep(0.06)
    press_key_vk(0x58)  # VK_X
    time.sleep(0.05)
    right_click_mouse()

def anchor_macro_loop():
    global anchor_macro_enabled
    while True:
        if anchor_macro_enabled:
            try:
                # anchor trigger: check the anchor_bind key state via GetAsyncKeyState if numeric, else skip
                code = anchor_bindings.get('anchor', 0)
                if isinstance(code, int) and (GetAsyncKeyState(code) & 0x8000):
                    run_macro_once()
                    while GetAsyncKeyState(code) & 0x8000:
                        time.sleep(0.01)
            except Exception:
                pass
        time.sleep(0.01)

def run_doubble_anchor_once():
    click_mouse_custom(XBUTTON2)
    right_click_mouse()
    time.sleep(0.05)
    click_mouse_custom(XBUTTON1)
    time.sleep(0.04)
    right_click_mouse()
    time.sleep(0.04)
    click_mouse_custom(XBUTTON2)
    time.sleep(0.05)
    press_key_vk(0x58)
    time.sleep(0.04)
    right_click_mouse()

def run_doubble_anchor_n_times(n):
    for i in range(n):
        run_doubble_anchor_once()
        time.sleep(0.01)

def doubble_anchor_macro_loop():
    global doubble_anchor_enabled
    while True:
        if doubble_anchor_enabled:
            try:
                code = anchor_bindings.get('double', 0)
                if isinstance(code, int) and (GetAsyncKeyState(code) & 0x8000):
                    run_doubble_anchor_n_times(2)
                    time.sleep(0.3)
            except Exception:
                pass
        time.sleep(0.01)

def auto_hit_crystal_once():
    right_click_mouse()
    time.sleep(0.05)
    kb.press_and_release(auto_hit_crystal_crystal_key)
    time.sleep(0.03)
    right_click_mouse()
    time.sleep(0.04)
    try:
        mouse.click(Button.left)
    except Exception:
        pass
    time.sleep(0.04)

def auto_hit_crystal_loop():
    global auto_hit_crystal_enabled
    while True:
        if auto_hit_crystal_enabled:
            try:
                if kb.is_pressed(auto_hit_crystal_obsidian_key):
                    for _ in range(auto_hit_crystal_repeat):
                        auto_hit_crystal_once()
                    while kb.is_pressed(auto_hit_crystal_obsidian_key):
                        time.sleep(0.01)
            except Exception:
                pass
        time.sleep(0.01)

def fast_exp_loop():
    global fast_exp_enabled
    while True:
        if fast_exp_enabled:
            try:
                if fast_exp_key and kb.is_pressed(fast_exp_key):
                    right_click_mouse()
                    time.sleep(0.05)
            except Exception:
                pass
        time.sleep(0.01)

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
    popup.geometry(f"250x200+{root.winfo_x()+60}+{root.winfo_y()+60}")
    popup.configure(bg="#2a2a2a")
    popup.attributes("-topmost", True)

    tk.Label(popup, text="Totem Offhand Keybinds", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=5)

    tk.Label(popup, text="Hotbar Key (slot):", fg="white", bg="#2a2a2a", font=mc_font).pack()
    hotbar_entry = tk.Entry(popup, font=mc_font, justify="center")
    hotbar_entry.insert(0, hotbar_key)
    hotbar_entry.pack()

    tk.Label(popup, text="Offhand Key:", fg="white", bg="#2a2a2a", font=mc_font).pack()
    offhand_entry = tk.Entry(popup, font=mc_font, justify="center")
    offhand_entry.insert(0, offhand_key)
    offhand_entry.pack()

    tk.Label(popup, text="Inventory Key:", fg="white", bg="#2a2a2a", font=mc_font).pack()
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

    # Buttons 
    tk.Button(popup, text="Save", command=save_keys, font=mc_font, bg="white").pack(pady=6)
    tk.Button(popup, text="✕", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack(pady=2)


# Short pearl one-shot (new feature): look down, right-click, return
def short_pearl_action_once():
    # Use a relative mouse move to simulate looking down and back
    try:
        # capture current mouse pos
        x, y = pyautogui.position()
        # move down by a large amount (simulate look down)
        pyautogui.moveRel(0, 300, duration=0.02)
        time.sleep(0.02)
        right_click_mouse()
        time.sleep(0.02)
        # move back to original
        pyautogui.moveTo(x, y, duration=0.02)
    except Exception:
        pass

def short_pearl_loop():
    global short_pearl_enabled
    while True:
        if short_pearl_enabled and toggle_binds.get("Short Pearl"):
            if kb.is_pressed(toggle_binds["Short Pearl"]):
                # Look down 90 degrees
                look_down_90()
                time.sleep(0.05)
                right_click_mouse()
                time.sleep(0.05)
                look_reset()  # restore original pitch/yaw
                # wait for release
                while kb.is_pressed(toggle_binds["Short Pearl"]):
                    time.sleep(0.01)
        time.sleep(0.01)


# start threads
threading.Thread(target=fast_exp_loop, daemon=True).start()
threading.Thread(target=anchor_macro_loop, daemon=True).start()
threading.Thread(target=doubble_anchor_macro_loop, daemon=True).start()
threading.Thread(target=auto_hit_crystal_loop, daemon=True).start()

# -------------------------
# Templates and vision (kept)
# -------------------------
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
    while True:
        if auto_firework_enabled:
            try:
                if GetAsyncKeyState(VK_RBUTTON) & 0x8000:
                    right_click_mouse()
                    time.sleep(auto_firework_delay)
            except Exception:
                pass
        time.sleep(0.005)

threading.Thread(target=auto_firework_loop, daemon=True).start()



def vk_to_readable(v):
    try:
        if isinstance(v, int):
            # ascii letters
            if 0x41 <= v <= 0x5A:
                return chr(v)
            # digits
            if 0x30 <= v <= 0x39:
                return chr(v)
            # common custom cases
            if v == 0x06:
                return "Mouse5"
            if v == 0x05:
                return "Mouse4"
            if v == 0x58:
                return "X"
            if v == 0x52:
                return "R"
            # fallback hex
            return hex(v)
        elif isinstance(v, str) and v:
            return v.upper()
    except Exception:
        pass
    return str(v)

def parse_bind_text_to_vk(s):
    """Accept friendly names like 'X', 'R', 'mouse5', or hex '0xNN' or decimal."""
    s = s.strip().lower()
    if not s:
        return None
    if s.startswith("0x"):
        try:
            return int(s, 16)
        except:
            return None
    if s.isdigit():
        try:
            return int(s, 10)
        except:
            return None

    if s in ("mouse5", "mb5", "xbutton1"):
        return 0x06
    if s in ("mouse4", "mb4", "xbutton2"):
        return 0x05
    if len(s) == 1:
        c = s.upper()
        return ord(c)
    # unknown
    return None

def toggle_colors(frame, label, state):
    bg = enabled_color if state else "#444444"
    frame.config(bg=bg)
    label.config(bg=bg)

def make_button(text, parent_frame):
    frame = tk.Frame(parent_frame, height=BUTTON_HEIGHT, bg="#444444")
    frame.pack(pady=PADDING, fill=tk.X, padx=10)
    label = tk.Label(frame, text=text, font=mc_font, fg="black", bg=frame["bg"], anchor="w")
    label.pack(expand=True, fill=tk.BOTH)
    button_states[text] = False

    def toggle():
        global spam_enabled, mode
        global anchor_macro_enabled, doubble_anchor_enabled, auto_hit_crystal_enabled
        global fast_exp_enabled, auto_firework_enabled, basefinder_enabled
        global autoxp_enabled, triggerbot_enabled, keypearl_enabled
        global pingcomp_enabled, crystalopt_enabled

        # CW exclusivity
        for other in list(button_states.keys()):
            if other.startswith("CW") and other != text:
                button_states[other] = False
                if other in button_refs:
                    toggle_colors(button_refs[other][0], button_refs[other][1], False)

        if text.startswith("CW"):
            mapping = {"CW Legit": 1, "CW MarlowCrystal": 2, "CW Auto DTAP": 3, "CW Blatant": 4}
            # correct behavior: toggling a CW sets spam_enabled and mode accordingly
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
        elif text == "Fast EXP":
            fast_exp_enabled = not fast_exp_enabled
        elif text == "Auto Firework":
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
            # short pearl is one-shot when its toggle bind pressed; the toggle button can also act as a trigger
            # pressing the button performs one-shot action
            short_pearl_action_once()

        button_states[text] = not button_states[text]
        toggle_colors(frame, label, button_states[text])

    # Right-click contextual popups
    def right_click(event):
        popup = None
        if text.startswith("CW"):
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"220x120+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="CW bind:", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=6)
            entry = tk.Entry(popup, font=mc_font, justify="center")
            entry.insert(0, bind_key)
            entry.pack()
            def savecw():
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
            tk.Button(popup, text="Save", command=savecw, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        elif text == "AutoHitCrystal":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"320x180+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="AutoHitCrystal - binds", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=6)
            tk.Label(popup, text="Toggle Bind:", fg="white", bg="#2a2a2a", font=mc_font).pack()
            tb = tk.Entry(popup, justify="center", font=mc_font)
            tb.insert(0, toggle_binds.get("AutoHitCrystal", ""))
            tb.pack()
            tk.Label(popup, text="Obsidian Key:", fg="white", bg="#2a2a2a", font=mc_font).pack()
            obs = tk.Entry(popup, justify="center", font=mc_font); obs.insert(0, auto_hit_crystal_obsidian_key); obs.pack()
            tk.Label(popup, text="Crystal Key:", fg="white", bg="#2a2a2a", font=mc_font).pack()
            cry = tk.Entry(popup, justify="center", font=mc_font); cry.insert(0, auto_hit_crystal_crystal_key); cry.pack()
            tk.Button(popup, text="Save", command=save, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

            def saveahc():
                global auto_hit_crystal_obsidian_key, auto_hit_crystal_crystal_key
                newtb = tb.get().strip()
                # set toggle bind (register)
                set_toggle_bind("AutoHitCrystal", newtb)
                auto_hit_crystal_obsidian_key = obs.get().strip().lower()
                auto_hit_crystal_crystal_key = cry.get().strip().lower()
                popup.destroy()

            tk.Button(popup, text="Save", command=saveahc, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        elif text in ("Anchor Macro", "Doubble Anchor"):
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"360x260+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text=f"{text} - Change Binds", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=6)

            entries = {}
            fields = [("anchor", "Anchor"), ("Explode", "Explode"), ("Glowstone", "Glowstone"), ("double", "Double")]
            for keyn, label_text in fields:
                tk.Label(popup, text=label_text + ":", fg="white", bg="#2a2a2a", font=mc_font).pack()
                e = tk.Entry(popup, font=mc_font, justify="center")
                val = anchor_bindings.get(keyn, 0)
                e.insert(0, vk_to_readable(val))
                e.pack()
                entries[keyn] = e

            # Toggle bind for this macro (executes macro directly)
            tk.Label(popup, text="Toggle Bind:", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=4)
            tb = tk.Entry(popup, justify="center", font=mc_font)
            tb.insert(0, toggle_binds.get(text, ""))
            tb.pack()

            def save_bindings():
                updated_binds = {}
                for k, ent in entries.items():
                    parsed = parse_bind_text_to_vk(ent.get().strip())
                    if parsed is not None:
                        anchor_bindings[k] = parsed
                        updated_binds[k] = parsed

                # update toggle bind for this macro
                new_toggle = tb.get().strip()
                set_toggle_bind(text, new_toggle)

                # ✅ instantly refresh global binds so macros use new keys
                globals().update({
                    "anchor_key": anchor_bindings.get("anchor"),
                    "explode_key": anchor_bindings.get("Explode"),
                    "glowstone_key": anchor_bindings.get("Glowstone"),
                    "double_key": anchor_bindings.get("double"),
                })

                # optional: print confirmation in console or UI
                print("[+] Updated anchor binds:", updated_binds)

                popup.destroy()

            tk.Button(popup, text="Save", command=save_bindings, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

            def anchor_macro_thread():
                global anchor_key
                while True:
                    if keyboard.is_pressed(anchor_key):
                        anchor_macro_action()
                    time.sleep(0.05)

                    def refresh_anchor_binds():
                        global anchor_key, explode_key, glowstone_key, double_key
                        anchor_key = vk_to_readable(anchor_bindings.get("anchor", 0))
                        explode_key = vk_to_readable(anchor_bindings.get("Explode", 0))
                        glowstone_key = vk_to_readable(anchor_bindings.get("Glowstone", 0))
                        double_key = vk_to_readable(anchor_bindings.get("double", 0))

            def anchor_listener():
                while running:  # running is a global flag to stop the thread safely
                    if keyboard.is_pressed(anchor_bindings.get("anchor", 0)):
                        anchor_macro()
                    if keyboard.is_pressed(anchor_bindings.get("Explode", 0)):
                        explode_macro()
                    if keyboard.is_pressed(anchor_bindings.get("Glowstone", 0)):
                        glowstone_macro()
                    if keyboard.is_pressed(anchor_bindings.get("double", 0)):
                        double_macro()
                    time.sleep(0.01)

# start the thread somewhere after your GUI initializes
            listener_thread = threading.Thread(target=anchor_listener, daemon=True)
            listener_thread.start()




        elif text == "Fast EXP":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"220x120+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Fast EXP Hotkey", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=10)
            entry = tk.Entry(popup, font=mc_font, justify="center")
            entry.insert(0, fast_exp_key)
            entry.pack(pady=4)
            def savef():
                global fast_exp_key
                fast_exp_key = entry.get().strip().lower()
                popup.destroy()
            tk.Button(popup, text="Save", command=savef, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        elif text == "Auto Firework":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"260x140+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Auto Firework Delay (ms)", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=8)
            slider = tk.Scale(popup, from_=50, to=2000, orient="horizontal", font=mc_font)
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
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Base Finder Settings", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=6)
            tk.Label(popup, text="Render distance:", fg="white", bg="#2a2a2a", font=mc_font).pack()
            rd_slider = tk.Scale(popup, from_=2, to=32, orient="horizontal", font=mc_font)
            rd_slider.set(basefinder_render_distance)
            rd_slider.pack(pady=4)
            checks = {}
            for opt in basefinder_options:
                var = tk.IntVar(value=1 if basefinder_options[opt] else 0)
                chk = tk.Checkbutton(popup, text=opt, variable=var, font=mc_font, bg="#2a2a2a", fg="white", selectcolor="#2a2a2a")
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
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="AutoXP Purchase - using template matching", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=8)
            tk.Label(popup, text=f"Template: {autoxp_template_path}", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=4)
            tk.Button(popup, text="Close", command=popup.destroy, font=mc_font, bg="white").pack(pady=6)

        elif text == "Trigger Bot":
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"300x120+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Trigger Bot Settings", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=8)
            tk.Label(popup, text="Threshold (0.5-0.95):", fg="white", bg="#2a2a2a", font=mc_font).pack()
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
            # existing key pearl popup (rename from Short Pearl)
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"300x140+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Key Pearl Toggle Bind:", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=8)
            tb = tk.Entry(popup, font=mc_font, justify="center")
            tb.insert(0, toggle_binds.get("Key Pearl",""))
            tb.pack(pady=4)
            def savekp():
                set_toggle_bind("Key Pearl", tb.get().strip())
                popup.destroy()
            tk.Button(popup, text="Save", command=savekp, font=mc_font, bg="white").pack(pady=6)
            tk.Button(popup, text="X", command=popup.destroy, font=mc_font, bg="#aa0000", fg="white").pack()

        elif text == "Short Pearl":
            # new short pearl (one-shot) popup for toggle bind
            popup = tk.Toplevel(root)
            popup.overrideredirect(True)
            popup.geometry(f"300x140+{root.winfo_x()+60}+{root.winfo_y()+60}")
            popup.configure(bg="#2a2a2a")
            popup.attributes("-topmost", True)
            tk.Label(popup, text="Short Pearl Bind:", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=8)
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


# Tab layout
tab_buttons_frame = tk.Frame(root, bg="#1e1e1e")
tab_buttons_frame.pack(fill="x")
tabs = {}
for name in ("Combat", "Misc", "Client"):
    f = tk.Frame(root, bg="#2a2a2a")
    tabs[name] = f

current_tab = "Combat"
def switch_tab(tabname):
    global current_tab
    for name in tabs:
        tabs[name].pack_forget()
    tabs[tabname].pack(fill="both", expand=True)
    current_tab = tabname
    for child in tab_buttons_frame.winfo_children():
        child.config(relief="flat")
    btns[tabname].config(relief="sunken")

btns = {}
for name in ("Combat", "Misc", "Client"):
    b = tk.Button(tab_buttons_frame, text=name, font=mc_font, bg="#2a2a2a", fg="white", bd=0, command=lambda n=name: switch_tab(n))
    b.pack(side="left", padx=6, pady=4)
    btns[name] = b

switch_tab("Combat")

# Feature placement
combat_features = ["CW Legit", "CW MarlowCrystal", "CW Auto DTAP", "Anchor Macro", "Doubble Anchor", "AutoHitCrystal", "Totem Offhand", "Fast EXP", "Trigger Bot", "Key Pearl", "Short Pearl"]
misc_features = ["Auto Firework", "Base Finder", "PingCompensation", "CrystalOptimizer", "AutoXP Purchase"]
client_features = ["Wale", "Self Destruct"]

for ftext in combat_features:
    make_button(ftext, tabs["Combat"])
    button_tab_map[ftext] = "Combat"
for ftext in misc_features:
    make_button(ftext, tabs["Misc"])
    button_tab_map[ftext] = "Misc"
for ftext in client_features:
    make_button(ftext, tabs["Client"])
    button_tab_map[ftext] = "Client"

def wale_right_click(event):
    global enabled_color
    c = colorchooser.askcolor(title="Choose wale color")
    if c and c[1]:
        enabled_color = c[1]
        for name, val in button_states.items():
            if val and name in button_refs:
                toggle_colors(button_refs[name][0], button_refs[name][1], True)

if "Wale" in button_refs:
    button_refs["Wale"][1].bind("<Button-3>", wale_right_click)
    button_refs["Wale"][0].bind("<Button-3>", wale_right_click)


def self_destruct_left():
    root.destroy()

def self_destruct_right(event):
    popup = tk.Toplevel(root)
    popup.overrideredirect(True)
    popup.geometry(f"320x160+{root.winfo_x()+60}+{root.winfo_y()+60}")
    popup.configure(bg="#2a2a2a")
    popup.attributes("-topmost", True)
    tk.Label(popup, text="Self Destruct Options", fg="white", bg="#2a2a2a", font=mc_font).pack(pady=8)

    var_delete_keybind = tk.IntVar(value=0)
    tk.Checkbutton(popup, text="Delete config", variable=var_delete_keybind, font=mc_font, bg="#2a2a2a", fg="white", selectcolor="#2a2a2a").pack(pady=6)

    var_delete_program = tk.IntVar(value=0)
    chk = tk.Checkbutton(popup, text="Delete executable", variable=var_delete_program, state="disabled", font=mc_font, bg="#2a2a2a", fg="#888888")
    chk.pack(pady=4)
    tk.Label(popup, text="Deletes all traces of the client.", fg="white", bg="#2a2a2a", font=("Consolas", 9)).pack(pady=4)

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


def clear_toggle_hook(feature):
    # unhook previous hook if present
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
    """Set a toggle bind (executes macro action once on press). Blank string removes bind."""
    keystring = keystring.strip() if keystring else ""
    # clear existing hook
    clear_toggle_hook(feature)
    toggle_binds[feature] = keystring
    if not keystring:
        return
    # set new hook
    def handler(e):
        # handler runs in keyboard thread; call appropriate action
        try:
            if feature == "AutoHitCrystal":
                # execute auto hit crystal once (repeat times)
                for _ in range(auto_hit_crystal_repeat):
                    auto_hit_crystal_once()
            elif feature == "Anchor Macro":
                run_macro_once()
            elif feature == "Doubble Anchor":
                run_doubble_anchor_n_times(2)
            elif feature == "Key Pearl":
                # emulate key pearl: just right click once
                right_click_mouse()
            elif feature == "Short Pearl":
                short_pearl_action_once()
        except Exception:
            pass

    try:
        # kb.on_press_key expects a single key like 'f' or 'F9', register
        hid = kb.on_press_key(keystring, lambda e: handler(e))
        toggle_hooks[feature] = hid
    except Exception:
        # fallback: try uppercase char
        try:
            hid = kb.on_press_key(keystring.lower(), lambda e: handler(e))
            toggle_hooks[feature] = hid
        except Exception:
            # can't bind; just store but no hook
            toggle_hooks[feature] = True

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

register_auto_totem_key()

# Start with menu visible
menu_visible = False
root.attributes('-alpha', 0.80)
listener = pynput_keyboard.Listener(on_press=on_press)
listener.start()
root.mainloop()

