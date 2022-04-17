//
//  Sumla+CoreDataProperties.swift
//  Sumla
//
//  Created by Brang Mai on 4/17/22.
//
//

import Foundation
import CoreData


extension Sumla {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sumla> {
        return NSFetchRequest<Sumla>(entityName: "Sumla")
    }

    @NSManaged public var artist_display: String?
    @NSManaged public var artist_title: String?
    @NSManaged public var artwork_type_title: String?
    @NSManaged public var department_title: String?
    @NSManaged public var dimensions: String?
    @NSManaged public var id: Int64
    @NSManaged public var image_id: String?
    @NSManaged public var medium_display: String?
    @NSManaged public var place_of_origin: String?
    @NSManaged public var provenance_text: String?
    @NSManaged public var publication_history: String?
    @NSManaged public var style_title: String?
    @NSManaged public var title: String?

}

extension Sumla : Identifiable {

}
