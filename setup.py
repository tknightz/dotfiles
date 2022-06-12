from subprocess import Popen, PIPE, STDOUT
import time


COLORS = {
    "RED": "\033[31m",
    "GREEN": "\033[32m",
    "YELLOW": "\033[33m",
    "BLUE": "\033[34m",
    "BOLD": "\033[1m",
    "RESET": "\033[m",
}


class JobExecutor:
    def __init__(self, name, command, is_subcommand=False):
        self.name = name
        self.command = command
        self.job = None
        self.i = 0
        self.frames = [
            "∙  ", "∙∙ ", "∙∙∙", "   "
        ]
        self.prefix = "\t- " if is_subcommand else ""
        self.succeed = True

    def execute(self):
        self.job = Popen(self.command, shell=True, stdout=PIPE, stderr=STDOUT)

    def show_progress(self):
        while self.job.poll() is None:
            print(COLORS["YELLOW"]
                  + f"{self.prefix}[{self.frames[self.i % len(self.frames)]}] {self.name}", end="\r")
            time.sleep(0.15)
            self.i += 1

    def show_done(self):
        stdout, stderr = self.job.communicate()
        if self.job.poll() != 0:
            print(COLORS["RED"] + f"{self.prefix}[x] Failed {self.name}")
            print(str(stdout))
            print(str(stderr))
        else:
            print(COLORS["GREEN"] + f"{self.prefix}[✓] Done {self.name}")

    def run(self):
        self.execute(),
        self.show_progress(),
        self.show_done()


def runCommands(commands: dict, is_subcommand=False):
    for k, v in commands.items():
        if isinstance(v, str):
            JobExecutor(k, v, is_subcommand).run()

        elif isinstance(v, dict):
            print(COLORS["BLUE"] + f"[-] {k}")
            runCommands(v, is_subcommand=True)


if __name__ == "__main__":
    commands = {
        "Setup Bootstrap": {
            "Install packages": "sudo pacman --noconfirm -Sy git neovim fish starship ripgrep git-delta bat xclip wezterm",
            "Install fonts":  "mkdir -p ~/.fonts && cp ./assets/fonts/* ~/.fonts && fc-cache -f -v",
        },
        "Setup shell": {
            "Create .config dir": "mkdir -p ~/.config",
            "Link starship config": "ln -sf $PWD/.config/starship.toml ~/.config/starship.toml",
            "Link fish config": "ln -sf $PWD/.config/fish ~/.config/fish",
            "Install oh-my-fish": "curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish",
            "Set fish as default": "chsh -s /usr/bin/fish"
        },
        "Setup terminal": {
            "Link config wezterm": "ln -sf $PWD/.config/wezterm ~/.config/wezterm",
            "Link config alacritty": "ln -sf $PWD/.config/alacritty ~/.config/alacritty",
        },
        "Setup neovim": {
            "Link config neovim": "ln -sf $PWD/.config/nvim ~/.config/nvim",
            "Install packer": "git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim" }
    }
    runCommands(commands)
