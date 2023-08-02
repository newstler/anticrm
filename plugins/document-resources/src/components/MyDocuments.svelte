<script lang="ts">
  import { PersonAccount } from '@hcengineering/contact'
  import { getCurrentAccount } from '@hcengineering/core'
  import Documents from './Documents.svelte'

  const currentUser = getCurrentAccount() as PersonAccount
</script>

<Documents query={{ authors: currentUser.person }} />
