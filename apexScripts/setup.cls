// set the user's manager so our PB will work for owner's manager
user u = [select id, managerId from user where firstname = 'User' and lastname = 'User'];

user i = [select id from user where firstname = 'Integration' and lastname = 'User'];

u.managerId = i.Id;

update u;

//make sure all accounts are marked active

list <account> accts = [select id, active__c from account];
for (account a:accts){
	a.active__c = 'Yes';
}
update accts;