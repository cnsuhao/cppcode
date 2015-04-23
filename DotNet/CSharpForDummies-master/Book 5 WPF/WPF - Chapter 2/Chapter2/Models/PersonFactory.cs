using System.Collections.Generic;

namespace Chapter2.Models
{
    public static class PersonFactory
    {
        public static IList<Person> GetPeople()
        {
            IList<Person> people = new List<Person>
            {
                new Person
                {Name = "John Doe", Address = "123 Elm", City = "Somewhere", State = "OH", Zip = "12345-1234"},
                new Person
                {Name = "Jane Doe", Address = "246 Main", City = "Somewhere", State = "OH", Zip = "12345-1234"}
            };
            return people;
        }
    }
}