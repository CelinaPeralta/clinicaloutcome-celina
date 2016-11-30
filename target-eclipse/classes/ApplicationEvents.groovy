/**
 * ApplicationEvents.groovy
 * @author Shun Hang Yip
 */
events = {
    'afterInsert' browser:true, namespace:'gorm', filter:Todo
    'afterDelete' browser:true, namespace:'gorm', filter:Todo
    'afterUpdate' browser:true, namespace:'gorm', filter:Todo
}
