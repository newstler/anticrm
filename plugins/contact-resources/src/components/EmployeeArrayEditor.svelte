<script lang="ts">
  import { Collaborator } from '@hcengineering/contact'
  import { Ref } from '@hcengineering/core'
  import type { ButtonKind, ButtonSize } from '@hcengineering/ui'
  import { IntlString } from '@hcengineering/platform'
  import UserBoxList from './UserBoxList.svelte'

  export let label: IntlString
  export let value: Ref<Collaborator>[]
  export let onChange: (refs: Ref<Collaborator>[]) => void
  export let readonly = false

  export let kind: ButtonKind = 'link'
  export let size: ButtonSize = 'medium'
  export let width: string | undefined = '100%'
  export let justify: 'left' | 'center' = 'left'

  let timer: any

  function onUpdate (evt: CustomEvent<Ref<Collaborator>[]>): void {
    clearTimeout(timer)
    timer = setTimeout(() => {
      onChange(evt.detail)
    }, 500)
  }
</script>

<UserBoxList items={value} {label} on:update={onUpdate} {kind} {size} {justify} {width} {readonly} />
