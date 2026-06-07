// darkmodern.nvim — colorscheme showcase
// AI-generated code for colorscheme highlighting demonstration only.
// No functional guarantees. Not intended for production use.

import React, {
	type FC,
	type ReactNode,
	useCallback,
	useEffect,
	useRef,
	useState,
} from "react";

// --- Types ---

type Status = "active" | "inactive" | "archived";
type Weight = number;

interface Item {
	id: number;
	label: string;
	weight: Weight;
	status: Status;
	tags: string[];
}

interface CardProps {
	item: Item;
	selected?: boolean;
	onSelect: (id: number) => void;
	children?: ReactNode;
}

// --- Utilities ---

const formatWeight = (w: Weight): string => w.toFixed(2);

function checksum(values: readonly number[]): number {
	return values.reduce((sum, v) => sum + v, 0);
}

// --- Hooks ---

function useGreeting(items: Item[]): string {
	const [greeting, setGreeting] = useState("Hello, World!");

	useEffect(() => {
		const total = checksum(items.map((i) => i.weight));
		setGreeting(
			total > 3.0
				? `Hello, World! (total: ${total.toFixed(2)})`
				: "Hello, World!",
		);
	}, [items]);

	return greeting;
}

// --- Components ---

const StatusBadge: FC<{ status: Status }> = ({ status }) => {
	const colors: Record<Status, string> = {
		active: "#a6e3a1",
		inactive: "#f9e2af",
		archived: "#6c7086",
	};

	return <span style={{ color: colors[status] }}>{status.toUpperCase()}</span>;
};

const Card: FC<CardProps> = ({
	item,
	selected = false,
	onSelect,
	children,
}) => {
	const ref = useRef<HTMLDivElement>(null);

	const handleClick = useCallback(() => {
		onSelect(item.id);
	}, [item.id, onSelect]);

	return (
		<div
			ref={ref}
			role="button"
			aria-selected={selected}
			onClick={handleClick}
			style={{
				border: selected ? "1px solid #89b4fa" : "1px solid #6c7086",
				padding: "1rem",
				cursor: "pointer",
			}}
		>
			<h2>{item.label}</h2>
			<p>Weight: {formatWeight(item.weight)}</p>
			<StatusBadge status={item.status} />
			{item.tags.map((tag) => (
				<span key={tag}>#{tag}</span>
			))}
			{children}
		</div>
	);
};

// --- App ---

const ITEMS: Item[] = [
	{
		id: 1,
		label: "alpha",
		weight: 1.5,
		status: "active",
		tags: ["foo", "bar"],
	},
	{ id: 2, label: "beta", weight: 2.0, status: "active", tags: ["bar", "baz"] },
	{ id: 3, label: "gamma", weight: 0.75, status: "inactive", tags: ["foo"] },
];

const App: FC = () => {
	const [selectedId, setSelectedId] = useState<number | null>(null);
	const greeting = useGreeting(ITEMS);

	const activeItems = ITEMS.filter(
		(item): item is Item => item.status === "active",
	);

	return (
		<main aria-label="showcase">
			<h1>{greeting}</h1>
			<p>{activeItems.length} active items</p>
			{ITEMS.map((item) => (
				<Card
					key={item.id}
					item={item}
					selected={selectedId === item.id}
					onSelect={setSelectedId}
				>
					<small>id: {item.id}</small>
				</Card>
			))}
		</main>
	);
};

export default App;
