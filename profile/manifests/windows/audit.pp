class profile::windows::audit {

  audit::policy { 'user Account Management':
    success => true,
    failure => true,
  }

  audit::policy { 'Process Creation':
    success => true,
    failure => false,
  }

  audit::policy { 'Sensitive Privilege Use':
    success => true,
    failure => true,
  }

  audit::policy { 'Security State Change':
    success => true,
    failure => true,
  }

  audit::policy { 'Security System Extension':
    success => true,
    failure => true,
  }

  audit::policy { 'System Integrity':
    success => true,
    failure => true,
  }

  audit::policy { 'Application Group Management':
    success => false,
    failure => false,
  }

  audit::policy { 'Other Account Management Events':
    success => true,
    failure => true,
  }

  audit::policy { 'Security Group Management':
    success => true,
    failure => true,
  }



}
