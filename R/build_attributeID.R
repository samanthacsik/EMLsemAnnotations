#' Automatically generate unique attribute IDs for semantic annotation using the datapackage entity number and the attribute name
#'
#' @param entity_num index of entity
#' @param eml_att_num index of attribute in current entity attribute
#' @param entity_path 'eml_get(doc$dataset, dataTable_or_otherEntity)'
#' @param current_eml_entity an entity from the EML file
#'
#' @return
#' @export
#'
#' @examples

build_attributeID <- function(entity_num, eml_att_num, entity_path, current_eml_entity){

  # if multiple entities present
  if(isTRUE(is.list(entity_path[[1]]))){

    # multiple entities, single attribute
    if(isTRUE(is.character(current_eml_entity$attributeList$attribute[[1]]))){
      entity_name <- paste("entity", entity_num, sep = "")
      attribute_name <- entity_path[[entity_num]]$attributeList$attribute$attributeName
      attribute_name_combo <- paste("attribute", attribute_name, sep = "_")
      attribute_id <- paste(entity_name, attribute_name_combo, sep = "_")

      # multiple entities, multiple attributes
    } else if(isTRUE(is.list(current_eml_entity$attributeList$attribute[[1]]))){
      entity_name <- paste("entity", entity_num, sep = "")
      attribute_name <- entity_path[[entity_num]]$attributeList$attribute[[eml_att_num]]$attributeName
      attribute_name_combo <- paste("attribute", attribute_name, sep = "_")
      attribute_id <- paste(entity_name, attribute_name_combo, sep = "_")
    }

    # if single, unpacked entity present
  } else if(isTRUE(is.character(entity_path[[1]]))){

    # single entity, single attribute
    if(isTRUE(is.character(current_eml_entity$attributeList$attribute[[1]]))){
      entity_name <- paste("entity", entity_num, sep = "")
      attribute_name <- entity_path[[entity_num]]$attributeList$attribute$attributeName
      attribute_name_combo <- paste("attribute", attribute_name, sep = "_")
      attribute_id <- paste(entity_name, attribute_name_combo, sep = "_")

      # single entity, multiple attributes
    } else if(isTRUE(is.list(current_eml_entity$attributeList$attribute[[1]]))){
      entity_name <- paste("entity", entity_num, sep = "")
      attribute_name <- entity_path$attributeList$attribute[[eml_att_num]]$attributeName
      attribute_name_combo <- paste("attribute", attribute_name, sep = "_")
      attribute_id <- paste(entity_name, attribute_name_combo, sep = "_")
    }
  }
}
