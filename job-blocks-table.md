# Nomad job spec blocks

Job spec blocks that you can use job, group, and task blocks.

```hcl
job "<job_name>" {
  ...
  group "<group_name>" {
    ...
    task "<task_name>" {
      ...
    }
  }
}
```

1 job has 1-many groups.
1 group has 1-many tasks.

|   | job | group | task |
|---|-----|-------|------|
| action  |  ❌   |    ❌   |    ✅    |
| affinity  |   ✅    |    ✅     |   ✅     |
| artifact  |   ❌  |   ❌    |    ✅    |
| constraint  |   ✅    |    ✅     |     ✅   |
|  consul |  ❌   |    ✅     |    ✅    |
| csi_plugin |  ❌   |    ❌   |   ✅     |
| disconnect  |  ❌   |    ✅     |   ❌   |
| dispatch_payload  |  ❌   |    ❌   |    ✅    |
| env  |   ❌  |     ❌  |   ✅     |
|  ephemeral_disk |  ❌   |    ✅     |    ❌  |
| group  |  ✅   |   ❌    |   ❌   |
| identity  |  ❌   |   ❌    |    ✅    |
| lifecycle  |  ❌   |   ❌    |    ✅    |
| logs  |  ❌   |    ❌   |    ✅    |
| meta  |   ✅    |    ✅     |    ✅    |
| migrate  |  ✅     |   ✅     |   ❌   |
| multiregion |   ✅    |   ❌    |   ❌   |
|  network |    ❌   |  ✅      |   ❌   |
| parameterized  |   ✅    |    ❌   |   ❌   |
| periodic  |    ✅   |  ❌     |   ❌   |
| reschedule  |   ✅    |   ✅      |   ❌   |
| resources  |   ❌  |    ❌   |    ✅     |
| restart  |  ❌   |     ✅     |    ✅     |
|  scaling |   ❌  |     ✅     |    ✅     |
| schedule  |   ❌  |   ❌    |   ✅      |
| secret  |   ✅     |    ✅      |    ✅     |
| service  |    ❌   |   ✅       |    ✅     |
| spread  |   ✅     |    ✅      |  ❌    |
| task  |   ❌  |   ✅       |   ❌   |
| template  |  ❌   |   ❌    |   ✅      |
| ui  |   ✅     |    ❌   |   ❌   |
| update  |   ✅     |   ✅       |   ❌   |
|  vault |   ✅     |    ✅      |    ✅     |
| volume  |  ❌   |    ✅      |  ❌    |
| volume_mount  | ❌    |    ❌   |    ✅     |
