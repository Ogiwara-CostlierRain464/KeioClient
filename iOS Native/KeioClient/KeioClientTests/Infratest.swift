import XCTest
import CoreData
@testable import KeioClient

class InfraTest : XCTestCase{
    
    var managedObjectContext: NSManagedObjectContext?
    
    override func setUp() {
        super.setUp()
        
        makeContent()
    }
    
    private func makeContent(){
        // 1. Create Managed Object Context
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])
        let storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!) as NSPersistentStoreCoordinator
        do {
            try storeCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        } catch let error as NSError {
            print("\(error) \(error.userInfo)")
            abort()
        }
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext!.persistentStoreCoordinator = storeCoordinator
    }
    
    func testDB(){
        //save
        let entity = NSEntityDescription.entity(forEntityName: "UserData", in: managedObjectContext!)!
        let cookie = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        
        cookie.setValue("yu", forKey: "email")
        cookie.setValue("pass", forKey: "password")
        try! managedObjectContext!.save()
        
        let data = try! managedObjectContext!.fetch(UserData.fetchRequest()) as! [UserData]
        
        assert(data[0].email == "yu")
        //保存するのはUserData(mail & pass)だけでは？
    }
}
