public class Apexclasses {
public List<ApexClass> classNames{set;get;}
public void names()
{
classNames=[SELECT id, name from ApexClass];
}
}