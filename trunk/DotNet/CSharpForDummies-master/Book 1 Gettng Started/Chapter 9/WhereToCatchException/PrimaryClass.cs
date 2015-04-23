namespace WhereToCatchException
{
  public class PrimaryClass
  {
    public void BossMethod(int item)
    {
      // Just let exceptions go on by to my caller.
      AssistantMethod(item);
    }

    public void AssistantMethod(int item)
    {
      // Just let exceptions go on by to my caller.
      HelperClass hc = new HelperClass();
      hc.TopMethod(item);
    }
  }
}
