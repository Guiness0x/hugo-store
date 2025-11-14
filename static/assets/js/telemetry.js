async function initTelemetry() {
  try {
    const res = await fetch('/telemetry/nodes.json');
    const data = await res.json();
    const container = document.getElementById('telemetry-nodes');

    container.innerHTML = ''; // clear before populate

    data.nodes.forEach(node => {
      const card = document.createElement('section');
      card.classList.add('card', `status-${node.status}`);
      card.innerHTML = `
        <h2>${node.name.toUpperCase()} <span class="node-status">${node.status.toUpperCase()}</span></h2>
        <p>${node.desc}</p>
      `;
      container.appendChild(card);
    });

    // Determine highest priority state for header glow
    const criticality = ['offline', 'pending', 'degraded', 'active'];
    const header = document.querySelector('.sigil');
    let worst = 'active';
    data.nodes.forEach(n => {
      if (criticality.indexOf(n.status) < criticality.indexOf(worst)) worst = n.status;
    });

    header.dataset.state = worst; // set state for CSS pulse
  } catch (err) {
    console.error('Telemetry relay failure:', err);
  }
}

document.addEventListener('DOMContentLoaded', initTelemetry);
