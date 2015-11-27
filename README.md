# auditpol
Puppet module for managing local security policies on Windows machines

This module uses auditpol to set local security policies. Creates a defined type audit::policy, which accepts 3 attributes, $policy, $success, and $failure

Multiple examples of usage in the profile::windows::audit class, but at a high level:

```
audit::policy { $policy:
  success => true, #true/false
  failure => false, #true/false
}
```

Tested on Windows Server 2012 R2, puppet enterprise 2015.3
