<script lang="ts">
  import { Collaborator } from '@hcengineering/contact'
  import { Ref } from '@hcengineering/core'
  import { ButtonKind, IconSize } from '@hcengineering/ui'
  import { PersonLabelTooltip } from '..'
  import contact from '../plugin'
  import { collaboratorByIdStore } from '../utils'
  import AssigneeBox from './AssigneeBox.svelte'
  import EmployeePresenter from './EmployeePresenter.svelte'

  export let value: Ref<Collaborator> | null | undefined
  export let kind: ButtonKind = 'link'
  export let tooltipLabels: PersonLabelTooltip | undefined = undefined
  export let onChange: ((value: Ref<Collaborator>) => void) | undefined = undefined
  export let colorInherit: boolean = false
  export let accent: boolean = false
  export let inline: boolean = false
  export let shouldShowName: boolean = true
  export let avatarSize: IconSize = kind === 'list-header' ? 'smaller' : 'x-small'

  $: employee = value ? $collaboratorByIdStore.get(value) : undefined

  function getValue (
    employee: Collaborator | undefined,
    value: Ref<Collaborator> | null | undefined
  ): Collaborator | null | undefined {
    if (value === undefined || value === null) {
      return value
    }
    return employee
  }
</script>

{#if onChange !== undefined}
  <AssigneeBox
    label={contact.string.Employee}
    {value}
    size={'medium'}
    kind={'link'}
    showNavigate={false}
    justify={'left'}
    {shouldShowName}
    {avatarSize}
    on:change={({ detail }) => onChange?.(detail)}
    on:accent-color
  />
{:else}
  <EmployeePresenter
    value={getValue(employee, value)}
    {inline}
    {tooltipLabels}
    disabled
    shouldShowAvatar
    shouldShowPlaceholder
    defaultName={contact.string.NotSpecified}
    shouldShowName={shouldShowName ? kind !== 'list' : false}
    {avatarSize}
    {colorInherit}
    {accent}
    on:accent-color
  />
{/if}
