import sublime, sublime_plugin, subprocess, os

class OpenWithLayoutEditorCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        if self.view.is_dirty():
            return
        if os.name != "nt":
            return

        startupinfo = subprocess.STARTUPINFO()
        startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW

        filename = self.view.file_name()
        if filename[-10:] == "Script.lua":
            filename = "{0}Layout.layout".format(filename[0:-10])
            print(filename)
        elif filename[-6:] != "layout":
            return

        process = subprocess.Popen(('C:/Work/kukuhero/NoahSDK/Noah3rdparty/MyGUI/VS2010OnOgre/bin/release/LayoutEditor.exe', filename),
            startupinfo=startupinfo)