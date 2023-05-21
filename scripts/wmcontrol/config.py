class Dmenu:
    def __init__(self) -> None:
        self.base = ['tofi']
        self.prompt = ['--prompt']
        self.font = ['--font=TerminessTTF Nerd Font']

class Config:
    def __init__(self) -> None:
        self.home_path = '/home/nitin'
        self.wm_config_path = '/home/nitin/.config/hypr/hyprland.conf'
        self.path = f'{self.home_path}/.config/scripts/wmcontrol'
    
