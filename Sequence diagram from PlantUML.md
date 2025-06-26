```plantuml
@startuml Start

title
 Sequence diagram from PlantUML
end title

Participant aaa
Participant bbb
Participant ccc
Participant ddd
Participant eee
Participant fff

activate aaa
aaa -> bbb : ExecuteAllDataBase()
note left : Click Start Button
    activate bbb
    bbb -> ccc : ExecuteAllDataBase()
        activate ccc
        ccc -> ddd : ExecuteAllDataBase()
            activate ddd
            ddd -> eee : ExecuteDataSet()
                activate eee
                    eee -> fff : DbDataAdapter.Fill()
                    activate fff
                        fff --> eee
                    deactivate fff
                    eee --> ddd
                deactivate eee
            ddd --> ccc
            deactivate ddd
        ccc --> bbb
        deactivate ccc
    bbb --> aaa
    deactivate bbb

@enduml
```

```
@startuml Start

title
 Sequence diagram from PlantUML
end title

Participant aaa
Participant bbb
Participant ccc
Participant ddd
Participant eee
Participant fff

activate aaa
aaa -> bbb : ExecuteAllDataBase()
note left : Click Start Button
    activate bbb
    bbb -> ccc : ExecuteAllDataBase()
        activate ccc
        ccc -> ddd : ExecuteAllDataBase()
            activate ddd
            ddd -> eee : ExecuteDataSet()
                activate eee
                    eee -> fff : DbDataAdapter.Fill()
                    activate fff
                        fff --> eee
                    deactivate fff
                    eee --> ddd
                deactivate eee
            ddd --> ccc
            deactivate ddd
        ccc --> bbb
        deactivate ccc
    bbb --> aaa
    deactivate bbb

@enduml
```