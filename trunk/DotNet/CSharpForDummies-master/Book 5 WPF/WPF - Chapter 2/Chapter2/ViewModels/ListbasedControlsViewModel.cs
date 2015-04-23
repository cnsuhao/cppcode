using System.Collections.Generic;
using Chapter2.Models;

namespace Chapter2.ViewModels
{
    public class ListbasedControlsViewModel
    {
        public IList<Person> People { get; set; }

        public ListbasedControlsViewModel()
        {
            People = PersonFactory.GetPeople();
        }

        public ListbasedControlsViewModel(IList<Person> people)
        {
            People = people;
        }
    }
}
