public class ContactListController{

        public List<Contact> contacts {get; set;}
        public string contactId {get; set;}
        public ContactListController()
        {
            contacts = [select Id, FirstName, LastName from Contact LIMIT 10];
        }
        public PageReference gotoContactDetailPage()
        {
            return new PageReference('/' + contactId);
        }
    }