<!--
    darkmodern.nvim — colorscheme showcase
    AI-generated code for colorscheme highlighting demonstration only.
    No functional guarantees. Not intended for production use.
-->

<script setup lang="ts">
import { ref, computed, watch, onMounted, type Ref } from "vue";

// --- Types ---

type Status = "active" | "inactive" | "archived";

interface Item {
    id:     number;
    label:  string;
    weight: number;
    status: Status;
    tags:   string[];
}

// --- Constants ---

const GREETING  = "Hello, World!" as const;
const THRESHOLD = 1.0;

const STATUS_COLORS: Record<Status, string> = {
    active:   "#a6e3a1",
    inactive: "#f9e2af",
    archived: "#6c7086",
};

// --- State ---

const items: Ref<Item[]> = ref([
    { id: 1, label: "alpha", weight: 1.5,  status: "active",   tags: ["foo", "bar"] },
    { id: 2, label: "beta",  weight: 2.0,  status: "active",   tags: ["bar", "baz"] },
    { id: 3, label: "gamma", weight: 0.75, status: "inactive", tags: ["foo"]        },
]);

const selectedId  = ref<number | null>(null);
const greeting    = ref(GREETING);
const searchQuery = ref("");

// --- Computed ---

const activeItems = computed(() =>
    items.value.filter(item => item.status === "active")
);

const filteredItems = computed(() =>
    items.value.filter(item =>
        item.label.includes(searchQuery.value.toLowerCase())
    )
);

const totalWeight = computed(() =>
    items.value.reduce((sum, item) => sum + item.weight, 0)
);

// --- Methods ---

function selectItem(id: number): void {
    selectedId.value = selectedId.value === id ? null : id;
}

function formatWeight(w: number): string {
    return w.toFixed(2);
}

function checksum(values: number[]): number {
    return values.reduce((sum, v) => sum + v, 0);
}

// --- Watchers ---

watch(totalWeight, (next, prev) => {
    if (next > 3.0) {
        greeting.value = `Hello, World! (total: ${next.toFixed(2)})`;
    } else {
        greeting.value = GREETING;
    }
});

// --- Lifecycle ---

onMounted(() => {
    const total = checksum(items.value.map(i => i.weight));
    console.log(`mounted — total weight: ${total.toFixed(2)}`);
});
</script>

<template>
    <main aria-label="showcase">

        <header>
            <h1>{{ greeting }}</h1>
            <p>{{ activeItems.length }} active / {{ items.length }} total</p>
        </header>

        <input
            v-model="searchQuery"
            type="text"
            placeholder="Search items..."
            aria-label="Search"
        />

        <ul role="list">
            <li
                v-for="item in filteredItems"
                :key="item.id"
                :aria-selected="selectedId === item.id"
                :class="['card', { 'card--selected': selectedId === item.id }]"
                @click="selectItem(item.id)"
            >
                <h2>{{ item.label }}</h2>
                <p>Weight: {{ formatWeight(item.weight) }}</p>

                <span :style="{ color: STATUS_COLORS[item.status] }">
                    {{ item.status.toUpperCase() }}
                </span>

                <span
                    v-for="tag in item.tags"
                    :key="tag"
                    class="tag"
                >
                    #{{ tag }}
                </span>

                <template v-if="item.weight > THRESHOLD">
                    <small>⚠ heavy item</small>
                </template>

            </li>
        </ul>

        <footer>
            <p>Total weight: {{ totalWeight.toFixed(2) }}</p>
        </footer>

    </main>
</template>

<style scoped>
main {
    background: #1e1e2e;
    color:      #cdd6f4;
    padding:    2rem;
    font-family: "JetBrains Mono", monospace;
}

.card {
    background:    #2a2a3d;
    border:        1px solid #6c7086;
    border-radius: 0.5rem;
    padding:       1rem;
    cursor:        pointer;
    transition:    border-color 200ms ease-in-out;
}

.card--selected {
    border-color: #89b4fa;
}

.tag {
    color:       #cba6f7;
    font-size:   0.75rem;
    margin-left: 0.25rem;
}
</style>
