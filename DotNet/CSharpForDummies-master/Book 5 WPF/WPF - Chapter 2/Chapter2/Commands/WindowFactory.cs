using System.Windows;
using Chapter2.Controls;
using Chapter2.Layouts;

namespace Chapter2.Commands
{
    public static class WindowFactory
    {
        public static Window CreateWindow(string windowName)
        {
            switch (windowName)
            {
                case "LayoutSamples":
                    return new LayoutSamples();
                case "ControlSamples":
                    return new ControlSamples();
                case "StackPanelSample":
                    return new StackPanelSample();
                case "WrapPanelSample":
                    return new WrapPanelSample();
                case "DockPanelSample":
                    return new DockPanelSample();
                case "CanvasSample":
                    return new CanvasSample();
                case "UniformGridSample":
                    return new UniformGridSample();
                case "GridSample":
                    return new GridSample();
                case "GridSpans":
                    return new GridSpans();
                case "SharedSizeGroups":
                    return new SharedSizeGroups();
                case "SimpleDataEntry":
                    return new SimpleDataEntry();
                case "ImageControl":
                    return new Images();
                case "TextBlockControl":
                    return new TextBlockAndLabel();
                case "ProgressBarControl":
                    return new ProgressBarSample();
                case "InputControls":
                    return new BasicInputControls();
                case "ComboBoxControl":
                    return new ComboBoxControl();
                case "ListBoxControl":
                    return new ListBoxControl();
                case "TreeViewControl":
                    return new TreeViewControl();
                case "DataGridControls":
                    return new DataGridControl();

                default:
                    return null;
            }
        }
    }
}