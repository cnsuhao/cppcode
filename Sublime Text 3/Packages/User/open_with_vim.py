import sublime, sublime_plugin, subprocess, os
#hehe
#wo qu
#hao ba
#hao ba
#hao ba
class OpenWithVimCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        if self.view.is_dirty():
            return
        if os.name != "nt":
            return

        startupinfo = subprocess.STARTUPINFO()
        startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW

        lines, _ = self.view.rowcol(self.view.size())

        sels = self.view.sel()
        row, col = self.view.rowcol(sels[0].begin())
        if row < lines | col > 0:
            row += 1

        process = subprocess.Popen(('D:\\Program Files (x86)\\Vim\\vim74\\gvim.exe', '-p', '--remote-tab-silent', '+%d' % row,  self.view.file_name()),
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, startupinfo=startupinfo)

        # adfsaf