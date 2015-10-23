using namespace System;
using namespace System::Security::Permissions;
using namespace Microsoft::Win32;

void CopyCmds(String^ from, String^ to, String^ parameter)
{
    RegistryKey^ everything = Registry::ClassesRoot->CreateSubKey(from);
    if (everything == nullptr)
    {
        return;
    }
    String^ cmd = safe_cast<String^>(everything->GetValue(""));
    cmd = cmd->Replace(parameter, "%V");

    RegistryKey^ dir_shell = Registry::ClassesRoot->CreateSubKey(to);
    RegistryKey^ dir_shell_command = dir_shell->CreateSubKey("command");
    dir_shell_command->SetValue("", cmd);
}

[assembly:RegistryPermissionAttribute(SecurityAction::RequestMinimum,
    ViewAndModify="HKEY_CURRENT_USER")];
int main(array<String^>^ args)
{
    CopyCmds("Folder\\shell\\搜索所有文件...\\command", "Directory\\Background\\shell\\搜索所有文件...", "%1");
    CopyCmds("BRUfile\\shell\\open\\command", "Directory\\Background\\shell\\Bulk Rename Here", "%L");

    return 0;
}