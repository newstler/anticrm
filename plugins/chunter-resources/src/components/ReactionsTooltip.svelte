<script lang="ts">
  import { Collaborator, PersonAccount, getName } from '@hcengineering/contact'
  import { personAccountByIdStore, collaboratorByIdStore } from '@hcengineering/contact-resources'
  import { Account, IdMap, Ref } from '@hcengineering/core'

  export let reactionAccounts: Ref<Account>[]

  function getAccName (acc: Ref<Account>, accounts: IdMap<PersonAccount>, employees: IdMap<Collaborator>): string {
    const account = accounts.get(acc as Ref<PersonAccount>)
    if (account !== undefined) {
      const emp = employees.get(account.person)
      return emp ? getName(emp) : ''
    }
    return ''
  }
</script>

{#each reactionAccounts as acc}
  <div>
    {getAccName(acc, $personAccountByIdStore, $collaboratorByIdStore)}
  </div>
{/each}
